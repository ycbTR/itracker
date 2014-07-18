class Exam < Asset
  has_attached_file :attachment

  validates :attachment, :attachment_presence => true

end