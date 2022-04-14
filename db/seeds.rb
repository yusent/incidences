employees = FactoryBot.create_list :employee, 30
employees.each { |e| FactoryBot.create :contract, employee: e }
