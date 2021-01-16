module adder8(a[7..0], b[7..0], cin : s[7..0], cout)
	fulladder(a[0], b[0],  cin : s[0], aux1)
	fulladder(a[1], b[1], aux1 : s[1], aux2)
	fulladder(a[2], b[2], aux2 : s[2], aux3)
	fulladder(a[3], b[3], aux3 : s[3], aux4)
	fulladder(a[4], b[4], aux4 : s[4], aux5)
	fulladder(a[5], b[5], aux5 : s[5], aux6)
	fulladder(a[6], b[6], aux6 : s[6], aux7)
	fulladder(a[7], b[7], aux7 : s[7], cout)
end module