class Profile < ApplicationRecord




    has_many(:educations, dependent: :destroy)
    accepts_nested_attributes_for(:educations , reject_if: :reject_education_create, allow_destroy: true)

  has_many(:projects, dependent: :destroy)
  accepts_nested_attributes_for(:projects, reject_if: :reject_project_create, allow_destroy: true)

  has_many(:experiences, dependent: :destroy)
  accepts_nested_attributes_for(:experiences, reject_if: :reject_experience_create, allow_destroy: true)

  has_one_attached :image

    belongs_to :user

  def image_thumbnail
    image.variant(resize: '150x150!').processed
  end

  def image_dp
    image.variant(resize: '150x250!').processed
  end
    def reject_education_create(education)
        education[:degree].blank? or education[:school].blank? or education[:start].blank? or education[:end].blank?
    end

  def reject_project_create(project)
    project[:title].blank? or project[:url].blank? or project[:tech].blank?
  end

  def reject_experience_create(experience)
    experience[:company].blank? or experience[:position].blank? or experience[:joining].blank? or experience[:ending].blank?
  end


end