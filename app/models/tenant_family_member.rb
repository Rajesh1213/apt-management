class TenantFamilyMember < ActiveRecord::Base
  enum member_type: { spouse: 0, child: 1, relative: 2 }
  enum marital_status: { married: 0, single: 1, divorced: 2 }
  enum gender: { male: 0, female: 1 }

  belongs_to :rental
end
