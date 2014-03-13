Red [
	Title: "Hanoi tower example"
	File: %hanoi.red
	Author: "Thiago Dourado de Andrade"
]

do [

towers: make object! [
	A:	[5 4 3 2 1]
	B:	[]
	C:	[]
]

move: func [disks [integer!] from [word!] to [word!]] [
	pegs: words-of towers

	auxPeg: first difference pegs reduce [from to]

	either disks > 1 [
		move disks - 1 from auxPeg
		move 1 from to
		move disks - 1 auxPeg to
	][
		 from: towers/:from
		 to: towers/:to

		 append to last from
		 remove back tail from

		show
	]
]

difference: func [right [series!] left [series!] /local diff][
	diff: copy right

	foreach item left [
		remove find diff item
	]

	diff
]

show: has [pegs disks lines diskChar pegChar disk height size line char] [
	pegs: values-of towers
	lines: copy []
	disks: 1
	diskChar: #"@"
	pegChar: #"|"

	foreach peg pegs [
		disks: disks + length? peg
	]

	repeat height disks [
		line: copy ""

		foreach peg pegs [
			case [
				disk: pick peg height [
					char: diskChar
				]
				disk: 0 [
					char: pegChar
				]
			]

			size: disk * 2 + 1
			insert/dup
			insert/dup
			insert/dup
				tail line
				space disks - disk
				char size
				space disks - disk
		]

		insert lines reduce [line lf]
	]

	print lines
]

show

move 5 'A 'C

]
