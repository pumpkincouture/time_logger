require 'model_citizen'

module LoggerConstants
  ADMIN = "admin"
  STANDARD = "standard"
  NONADMIN = "non-admin"
  BILLABLE = "Billable"
  NONBILLABLE = "Non-billable"
  PTO = "PTO"
  STANDARD_CLIENT = "standard"
  CHOICE_1 = "1"
  CHOICE_2 = "2"
  CHOICE_3 = "3"
  CHOICE_4 = "4"
  CHOICE_5 = "5"
  YES_LOG_OUT = "y"
  STANDARD_OPTIONS = {1=> ModelCitizen::Messages.new.get_message("log_time"),
                      2=> ModelCitizen::Messages.new.get_message("request_report")
                     }
  ADMIN_OPTIONS = {1=> ModelCitizen::Messages.new.get_message("log_time"),
                  2=> ModelCitizen::Messages.new.get_message("request_report"),
                  3=> ModelCitizen::Messages.new.get_message("add_employee"),
                  4=> ModelCitizen::Messages.new.get_message("add_client"),
                  5=> ModelCitizen::Messages.new.get_message("request_employee_report")
                  }
  BILL_OPTIONS = {1=> "Billable", 2=> "Non-billable", 3=> "PTO"}
  BILLABLE_PROJECT_TYPE = "BillableProject"
  NON_BILLABLE_PROJECT_TYPE = "NonBillableProject"
  PTO_PROJECT_TYPE = "PTOProject"
end