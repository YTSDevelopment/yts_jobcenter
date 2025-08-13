
Config = {}

-- Job Center Locations
Config.JobCenters = {
    {
        name = "Los Santos Job Center",
        coords = vector3(-545.49, -203.80, 38.21),
        blip = {
            sprite = 407,
            color = 3,
            scale = 0.8,
            display = 4
        },
        marker = {
            type = 1,
            size = {x = 1.0, y = 1.0, z = 1.0},
            color = {r = 0, g = 150, b = 255, a = 200}
        }
    },
   /* {
        name = "Paleto Bay Job Center",
        coords = vector3(-140.0, 6254.0, 31.5),
        blip = {
            sprite = 407,
            color = 3,
            scale = 0.8,
            display = 4
        },
        marker = {
            type = 1,
            size = {x = 1.0, y = 1.0, z = 1.0},
            color = {r = 0, g = 150, b = 255, a = 200}
        }
    }*/--additional job centers if wanted, configure to your liking
}

-- Available Jobs 
Config.Jobs = {
    {
        name = "unemployed",
        label = "Unemployed",
        description = "No current employment.",
        salary = 0,
        icon = "fas fa-user-times",
        color = "#6c757d"
    },
    {
        name = "electrician",
        label = "Electrician",
        description = "Fix electrical problems.",
        salary = 250,
        icon = "fas fa-bolt",
        color = "#ffc107"
    },
    {
        name = "animalcontrol",
        label = "Dog Catcher",
        description = "Catch stray dogs",
        salary = 350,
        icon = "fa-solid fa-dog",
        color = "#fd7e14"
    },
    {
        name = "trucker",
        label = "Truck Driver",
        description = "Deliver goods",
        salary = 450,
        icon = "fa-solid fa-truck",
        color = "#007bff",
        whitelist = false -- Requires approval, ideal for police/ems jobs
    },
    {
        name = "janitor",
        label = "Janitor",
        description = "Keep floors clean",
        salary = 400,
        icon = "fa-solid fa-broom",
        color = "#dc3545",
        whitelist = false
    },
    {
        name = "taxi",
        label = "Taxi Driver",
        description = "Transport customers",
        salary = 300,
        icon = "fas fa-car",
        color = "#28a745"
    },
}

Config.Texts = {
    blip_name = "Job Center",
    marker_help = "Press ~INPUT_CONTEXT~ to open Job Center",
    job_changed = "You have changed your job to: %s",
    job_change_error = "You cannot change to this job",
    whitelist_job = "This job requires approval from administration",
    same_job = "You already have this job",
    ui_title = "Job Center",
    current_job = "Current Job",
    available_jobs = "Available Jobs",
    select_job = "Select Job",
    close = "Close",
    salary_label = "Salary",
    per_hour = "/hour",
    target_label ="Job Center"
}



Config.UI = {
    title = "Job Center",
    subtitle = "Choose your career path"
}