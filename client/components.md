# Scool Components

## Misc Components

- `Navbar`

    - Displays different content depending on the current role of the user

- `MoreButton`

    - Props:
    ```typescript
        clickHandler:function
    ```

## LoginPage (`/login`)

- `LoginForm`

    - Login form with email and password
  
## HomePage (`/home`)

   - Either `StudentDashboard`, `AdminDashboard`, or `InstructorDashboard`

        - Contains the main actions a user would want to do

        - `StudentDashboard`
          
          - `DashboardCard`s

            - Props: 
            ```typescript
                title:string
                content:string
                clickHandler:function
            ```

            - Contain at a glance information about courses, assignments, etc.

        - `InstructorDashboard`

            - `CourseSwitcher`

                - Enables the user to switch between courses

            - `DashboardCard`s

                - Same as student dashboard (ish)

        - `AdminDashboard`

            - `NewButton`
              
              - Props:
              ```typescript
                clickHandler:function
              ``` 

            - `AdminList`s

            - Props:
            ```typescript
                title:string
                list:array
                cardClickHandler:function
            ```


## AssignmentShowPage

### As an instructor

- `CourseInfo`
  
    - Displays the name, a description, the instructors...

- `ActiveAssignments`

    - Displays the assignments that are currently active
    
    - `ActiveAssignmentCard`

        - Props
        ```typescript
        assignmentTitle:string
        ```

        - On click, should view the submissions to that assignment

    - `MoreButton`

        - Should go to the assignments index page (for that course)

- `Enrolments`

    - A list of all the students enroled in the course

