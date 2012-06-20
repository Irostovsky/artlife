module TranslatedModel

  def self.included(base)
    base.class_eval do
      accepts_nested_attributes_for :translations
      attr_accessible :translations_attributes
      has_many :translations
      accepts_nested_attributes_for :translations
      after_initialize :init_translations
    end

    base::Translation.class_eval do
      attr_accessible :locale, *base.translated_attribute_names
    end

    base.instance_eval do
      base.translated_attribute_names.each do |name|
        define_method "#{name}_by_locale" do |locale|
          translations.find_by_locale(locale).try name
        end
      end
    end
  end

  def init_translations
    if self.translations.empty?
      Artlife::Application.config.locales.each do |locale|
        self.translations.build :locale => locale
      end
    end
  end

end