from pint import UnitRegistry
units = UnitRegistry()

a = 10 * units.hertz
print(a) # 10 hertz
b = a.to(units.radian / units.second)
print(b) # 10.0 radian / second