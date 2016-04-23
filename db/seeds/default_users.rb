#Generate Users
supervisor = User.create( username: "supervisor", email: "supervisor@oars.com", password: "password", password_confirmation: "password", role_id: 4)
manager = User.create( username: "manager", email: "manager@oars.com", password: "password", password_confirmation: "password", role_id: 3)
assistant = User.create( username: "assistant", email: "assistant@oars.com", password: "password", password_confirmation: "password", role_id: 2)

staff_supervisor = Staff.create( first_name: "Sully", last_name: "Supervisor", position: Staff.positions[:supervisor], gender: Staff.genders[:male], dob: "1990-01-01", salary: 50_000, user: supervisor)

staff_manager = Staff.create( first_name: "Mary", last_name: "Manager", position: Staff.positions[:manager], gender: Staff.genders[:female], dob: "1990-01-02", salary: 40_000, user: manager)

staff_assistant = Staff.create( first_name: "Alex", last_name: "Assistant", position: Staff.positions[:assistant], gender: Staff.genders[:male], dob: "1990-01-03", salary: 30_000, user: assistant)
