class JobAd < ApplicationRecord
  has_many :job_applications, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :company_name, presence: true
  validates :deadline, presence: true
  validates :category, presence: true

  # regex taken form https://github.com/heartcombo/devise/blob/5d5636f03ac19e8188d99c044d4b5e90124313af/test/rails_app/config/initializers/devise.rb#L102
  validates :company_email,
    presence: true,
    format: {
      with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$\z/,
    }

  def expired?
    return true if deadline < Date.today
  end
end
