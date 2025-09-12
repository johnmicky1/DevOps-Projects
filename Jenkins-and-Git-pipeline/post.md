
Steps to Establish a Pipeline between GitHub and Jenkins

Step 1: Create a GitHub Repository
- Log in to GitHub and click on "New" to create a new repository.
- Give your repository a name (e.g., "My-blog1-2025") and description (e.g., "It's a practice blog").
- Make the repository public.
- Add a README file.
- Click on "Create Repository".
- Create a new file (e.g., "post1.md") and add text to it.
- Commit the changes.

Step 2: Install Pandoc
- Go to the Pandoc installation page (https://pandoc.org/installing.html).
- Download the latest installer (e.g., "pandoc-3.7.0.2-windows-x86_64.msi" for Windows).
- Run the installer, which will install Pandoc under "Program Files".

Step 3: Configure Jenkins
- Log in to Jenkins using your username and password.
- Click on "New Item" and give it a name.
- Select "Freestyle project" and click "OK".
- Configure the Git repository connection:
    - Enter the repository URL (including ".git" at the end).
    - Set the branch specifier to match the repository location (e.g., "*/main").
- Add a build step:
    - Select "Execute Windows batch command".
    - Paste the following code:

@echo on
"C:\Program Files\Pandoc\pandoc.exe" post1.md -o post1.html
dir /b post1.html

+ Explanation for each line of code:
	- `@echo on`: Helps to display the command in the command prompt.
	- `"C:\Program Files\Pandoc\pandoc.exe" post1.md -o post1.html`: Converts `post1.md` to `post1.html`.
	- `dir /b post1.html`: Displays the `post1.html` file name, confirming its creation.

- Save the configuration.

Step 4: Run the Jenkins Job
- Click on "Build Now" to run the job.
- Wait for the job to complete.
- Check the console output to verify that the job was successful.
- Open the workspace in a new tab to view the generated HTML file.

By following these steps, you can establish a pipeline between GitHub and Jenkins to convert Markdown files to HTML using Pandoc.
