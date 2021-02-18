# pet-clinic   
## Contents
* [Introduction](#introduction) 
  * [Objective](#objective)
  * [Proposal](#proposal)
* [Architecture](#architecture)
  * [Risk Assessment](#risk-assessment)
  * [Kanban Board](#kanban-board)
  * [User stories](#user-stories)
  * [Burndown](#Burndown)
* [Infrastructure](#infrastructure)
  * [Pipeline](#pipeline)
* [Cost analysis](#Cost-analysis)
  * [Virtual machines](#Virtual-machines)
  * [Infrastructure](#Infrastructure) 
  * [Final costs](#Final-costs)
* [Footer](#footer)

## Introduction

### Objective
The objective for this group project was to deploy a spring petclinic application that runs on AngularJS alongside a Java API in order to demonstrate our ability to utilise DevOps tools to provide continuous integration and delivery even with applications and languages we are unfamiliar with. We must find our own solution and decide on the tools we believe will work best as well as demonstrate our workflow.

Further requirements include:

* Multiple environment support
* Justify tool use
* Show cost analysis


### Proposal

Our approach to this project is to utilise the azure DevOps pipeline interfaced with a Github webhook for the repository for automated continuous integration and delivery. We use this pipeline to test the application using Karma, build and push it with Docker to Dockerhub, set up host configuration with Terraform and deploy it with Kubernetes. 

The reason we decided on the DevOps pipeline was because our resources were created in azure and several az commands are required in our configuration and the azure DevOps pipeline is designed to be easily integrated with the azure portal. 

Karma was used simply because the applications tests were designed for it and while some reconfiguration within the applications scripts were required it was significantly easier and quicker than building new tests would have been.

Docker was used to build and push the application partly because of our familiarity with Docker and partly because the back end API was already stored in Docker hub and it would save time and effort to have both applications stored and containerised in the same manner.

The reason Terraform was selected was because it can do all the infrastructure on any cloud platform in one language. It is also really easy to make changes and it will let you know exactly what it will change which is extremely useful for such an experimental project.

Kubernetes was used because Azure has it’s own managed Kubernetes services which help configure and deploy our clusters. This combined with it’s functionality with Docker it’s easy scalability and it’s portability made it the ideal choice for the project.

## Architecture

### Risk Assessment
![risk][risk]
### Kanban Board

For our Kanban board we used Trello to track our project and you can see our board below.

![Kanban][kanban]

Here is the link to view our board: https://trello.com/b/Uq1lOfCr/group-project-team-3

The Trello board has the following sections:

* Project resources- Links to parts of our projects and list of special team roles
* User stories- What the user wants and why. This is used to not lose focus on why we have our tasks to help find solutions or alternatives when needed. Most user stories are tagged with this label but in other sections.
* Backlog- Incomplete tasks and requirements.
* Sprint backlog- Backlog for current sprint.
* In progress- Tasks currently being worked on
* Sprint 1 complete: Completed tasks
* On hold- Tasks not to be completed for now but could be done in future.
 
We also have tags to show a tasks priority (Must, Should, Could, Won’t) as well as tags for the tasks type and the task owner. 

### User stories

### Burndown

Here you can see our Burndown chart.

![Burndown][burndown]

The above shows the completion of tasks throughout the sprint as well as the effort of both tasks completed and work done measured relative to one another. It also shows the ideal completion rate or “burndown”  and the remaining tasks and effort for the sprint.

Below you can see a table of the major tasks and their relative effort.

![bdtable][bdtable]


## Infrastructure

### Pipeline


## Cost analysis

This section will focus on the costs of our project so far as well as the project costs moving forward. 

### Virtual machines

Below are all the resource groups needed to manage virtual machines and their costs from the start of the project until 17.02.2021. These are also our temporary resources. Virtual machines were needed to provide fresh environments for each build attempt in order to mimic the pipelines environment so that the entire process for each of the stages can be built for automation. 

![testcost][testcost]

This was the cost of running the tests on virtual machines for the project (£0.85). Even though this data goes until February 17th the data ends at the 16th because that was when testing was completed and implemented into the pipeline and so the resource group deleted. As a result there are no projected costs for this group however for future sprints end to end testing could be implemented that will run up similar costs as the same size virtual machines (B2s) will need to be used to handle the applications and CPU usage needed for testing. So projected testing cost for the next sprint is £0.85.

![buildcost][buildcost]

This was the cost of running the build and push stages for the project (£4.85). As this has now been completed and implemented into the pipeline the resource group has been deleted and there are no projected future costs.

![kubevmcost][kubevmcost]

This was the cost of the Kubernetes virtual machines (£2.64). At time of writing Azure has no calculated the cost for 18.02 which is the final day this group needed to remain active as such the projected cost for this resource group for this sprint is £3.00 maximum and there are no projected costs for future sprints as it is integrated into the pipeline.

![terracost][terracost]

This was the total costs for Terraform. The cost for the virtual machine resource group is £0.74. As this is now also done through the pipeline the resource group is deleted and there are no projected costs. 

The total costs of virtual machines for this sprint is £9.08 current and is projected to be £9.44 For the next sprint this cost is expected to be the end to end testing costs for a total of £0.85.

### Infrastructure

This section covers the costs of running the infrastructure moving forward. These can be considered our permanent resources.

From the final image in the above section you can see the costs for running the terraform configuration is £1.42. This was the running cost for 2 days giving us £0.71 per day. There is one day left in the first sprint at time of writing so the projected cost for this sprint is £2.13. For future sprints this should remain consistent giving us a projected cost of £4.97.

![pipecost][pipecost]

As you can see from the above picture Microsoft's azure pipelines allow for 1 free job so the cost of running the pipeline is nothing. In case of multiple projects being required the projected sprint costs of using a Microsoft-hosted job is approximately £7.50. 

![nexuscost][nexuscost]

This was the cost of running nexus as our docker repository(£3.22). The reason for the low initial cost followed by a consistent incline is because the size was upscaled significantly. As this needs to be run persistently to store the docker images the costs are projected to remain consistent at around 60p per day. So for the end of this sprint the final cost should be approximately £3.82. For a future week long sprint the projected costs for this resource is £4.80.

![kubecost][kubecost]

The cost of running our Kubernetes was £13.41. This is by far the most expensive resource as an expensive virtual machine (D series) is automatically put in place to host the cluster.  The per day costs have reduced towards the end of the sprint as experimentation was significantly heavier towards the beginning. Due to the fluctuation in cost per day we have decided to take the final day cost as a predictive model as that is the setup closest to our final design giving us an estimated cost of £1.20 per day.  As there is one day left of the sprint yet to be analysed by Microsoft the projected cost for this sprint is £14.61. For the next sprint the projected cost is estimated to be £8.40. 

The total cost for infrastructure for this sprint is £18.05 currently and is expected to be £20.56. The projected cost for the next sprint is expected to be approximately 18.71, however should our pipeline no longer be our free job  this cost will rise to 25.67.

### Final costs

## Footer

### Future Improvements

### Contributors
- [Oliver Nichols](https://github.com/OliverNichols)  
- [Michael Bunko](https://github.com/MBunko)  
- [Abaseen Popal](https://github.com/abaseen-popal)  
- [Yusuf Yasin](https://github.com/ykyasin)  
- [Naserul Islam](https://github.com/Nas-Islam)  

### Acknowledgements
- [Harry Volker](https://github.com/htr-volker)  
- [Dara Oladapo](https://github.com/DaraOladapo)



[risk]: https://i.imgur.com/3MGczIo.png
[kanban]: https://i.imgur.com/6FfuU4t.png
[burndown]: https://i.imgur.com/zZntHmh.png
[bdtable]: https://i.imgur.com/5Jru4fm.png
[testcost]: https://i.imgur.com/qEq0ZuF.png
[buildcost]: https://i.imgur.com/DxaA1yi.png
[nexuscost]: https://i.imgur.com/H4huVmO.png
[kubevmcost]: https://i.imgur.com/Qg8XXdg.png
[terracost]: https://i.imgur.com/erN12NJ.png
[pipecost]: https://i.imgur.com/eFasIWn.png
[kubecost]: https://i.imgur.com/1weQx8U.png 
