# GMS2_RPG_CombatSystem (WIP)
A small project that recreates a simple JRPG combat system

This project features a simple, but complete JRPG-style combat system. 
The control (manager) is in charge of sorting the turn order, controlling UI layer visibility and updating unit lists when necessary.

Each unit has its own control system in the form of a state machine. It only does things based on Player input (in the future, AI motions will be implemented).
