# frozen_string_literal: true

class ApplicationService
  include ActiveModel::Validations

  attr_reader :result, :error

  def error_code
    @error_code || "E_INVALID"
  end

  def resp_code
    @resp_code || :ok
  end

  private

  attr_reader :params

  def t_now
    @_t_now ||= Time.zone.now
  end

  def today
    @_today ||= t_now.to_date
  end

  def merge_errors_from(object, prefix=nil, default_errors=nil)
    _gather_errors(object.errors.messages, prefix) if object.errors.present?
    _gather_errors(default_errors, prefix) if default_errors && errors.blank?
    false
  end

  def _gather_errors(messages, prefix)
    @error_messages = "#{prefix}: #{messages}\n"
  end
end
