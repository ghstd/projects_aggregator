class ChangeUserIdNullInRequestLoggers < ActiveRecord::Migration[7.1]
  def change
    change_column_null :request_loggers, :user_id, true
  end
end
