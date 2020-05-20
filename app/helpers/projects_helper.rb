module ProjectsHelper

    # [Abstract] 
    # [Projection] f: String[] -> String[]
    def array_of_project_name(projects)
        arr = []
        for p in projects do
            arr.push(p.name)
        end
        arr
    end
end
