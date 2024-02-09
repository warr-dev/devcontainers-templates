reference: [laravel devcontainer](https://github.com/theomessin/laravel-devcontainer)
## Requrements
- vscode
- remote vscode extensions
- nginx  conf knowledge
- basic linux knowledge
- knowledge wit docker and docker compose

## How to use
- clone this repo
- use vscode (local or remote ssh)
- this is what will it look like ouside devcontainer (.devcontainer was hidden)
 ![alt text](assets/5.png)
- click remote options (bottom left)
 ![alt text](assets/1.png)
- Reopen in container
 ![alt text](assets/2.png)
- this is what it will looks like
 ![alt text](assets/3.png)
- you will land with current directory with example project, you can add folder to add project
 ![alt text](assets/4.png)
- if you add project edit configuration (cant be accessed inside devcontainer so local or ssh remote)

  - example i add laravel project
   ![laravel](assets/laravel.png)
  - configuration resides at .devcontainer folder
  - add configuration for nginx at ./devcontainer/sites
   ![alt text](assets/6.png)
    - set port (listen) on and path (root) for project
   ![alt text](assets/root.png)
  - add port map on nginx service on docker-compose.yml
   ![alt text](assets/port.png)
  - restart nginx container to take effect
   ![alt text](assets/restart.png)