class SearchTerm
  attr_reader :where_clause, :where_args, :order

  def initialize(search_term, opts = {})
    search_types = opts[:search_types] || ['name', 'email']

    search_term = search_term.downcase
    @where_clause = ""
    @where_args = {}

    build_for_email_search(search_term) if search_term =~ /@/ && search_types.include?('email')

      #logger.debug "Build for Name Search"
    build_for_name_search(search_term) if search_types.include?('name')

    build_for_content_search(search_term) if search_types.include?('content')
  end

private
  def build_for_email_search(search_term)

    @where_clause << case_insensitive_search(:email)
    @where_args[:email] = search_term

    @order = "lower(email) = " +
      ActiveRecord::Base.connection.quote(search_term) +
      " desc, last_name asc"
  end

  def extract_name(email)
    email.gsub(/@.*$/,'').gsub(/[0-9]+/,'')
  end

  def build_for_name_search(search_term)
    @where_clause << case_insensitive_search(:first_name)
    @where_args[:first_name]  = starts_with(search_term)

    @where_clause << " OR #{case_insensitive_search(:last_name)}"
    @where_args[:last_name] = starts_with(search_term)

    @order = "last_name asc"
  end

  def build_for_content_search(search_term)
    @where_clause << case_insensitive_search(:content)
    @where_args[:content]  = starts_with(search_term)
  end

  def starts_with(search_term)
    search_term + "%"
  end

  def case_insensitive_search(field_name)
    "lower(#{field_name}) like :#{field_name}"
  end


end
