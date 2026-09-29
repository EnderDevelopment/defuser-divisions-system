# Defuser Divisions System

A FiveM script for bomb defusal with rewards and penalties.

## Features

- Bomb defusal with a configurable timer
- Rewards and penalties for successful and failed defusions
- Player statistics tracking (defuses and fails)

## Requirements

- FiveM server with ESX framework
- MySQL database

## Installation

1. Download the script files
2. Place them in your FiveM server resources folder
3. Add `start defuserDivisionsSystem` to your server.cfg
4. Import the database.sql file into your MySQL database

## Usage

- Players can defuse bombs using the `/defuse` command
- The script will notify players of success or failure
- Player statistics are automatically tracked and updated

## Configuration

Edit the `config.lua` file to adjust:

- Defuse time (in seconds)
- Reward amount for successful defusions
- Penalty amount for failed defusions

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=defuser-divisions-system&utm_content=bottom) — describe it in one sentence and get the full source code.