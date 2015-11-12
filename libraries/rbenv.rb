class Chef
  class Recipe
    def rbenv(command)
      stronglifters_rbenv(command)
    end

    def gem(command)
      stronglifters_gem(command)
    end
  end
end
