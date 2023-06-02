<h1>Modified Standalone Zombie System [Synchronized]</h1>

This is a modification of the Synchronized Standalone Zombie System by WeponzTV. This variation will have many changes over time, and there is no guarantee of function, but the idea is for a different kind of server.

Thanks to WeponzTV for the variation I'm working with here, and
Special thanks to <a href="https://github.com/Dislaik">Dislaik</a> for the base code.

# Changelog

## v1.0.0-alpha
> (2023-06-02)

The SafeZones table and the code that creates blips for safe zones was removed, the code related to handling safe zones, including the loop that checks if a zombie is within a safe zone and deletes it was also removed.

By removing these parts, I  eliminated the functionality related to safe zones and focused solely on the implementation of infected zones where zombies can spawn.
