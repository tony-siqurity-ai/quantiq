#!/usr/bin/env python3
"""
Test script for Cirquit functionality
"""
from cirquit import QuantumCircuit, plot_results

print("=" * 60)
print("CIRQUIT LIBRARY TEST")
print("=" * 60)

# Test 1: Bell State
print("\n1. Testing Bell State")
print("-" * 60)
qc = QuantumCircuit(2)
qc.h(0).cx(0, 1).measure_all()

print("Circuit:")
print(qc.draw())

print("\nRunning circuit (1000 shots)...")
result = qc.run(shots=1000)

print("\nResults:")
print(plot_results(result))

# Test 2: GHZ State
print("\n2. Testing GHZ State (3-qubit entanglement)")
print("-" * 60)
qc = QuantumCircuit(3)
qc.h(0).cx(0, 1).cx(1, 2).measure_all()

print("Circuit:")
print(qc.draw())

print("\nRunning circuit (1000 shots)...")
result = qc.run(shots=1000)

print("\nTop outcomes:")
for outcome, count in result.most_common(5):
    prob = count / result.shots
    print(f"|{outcome}⟩: {count} ({prob:.2%})")

# Test 3: Superposition
print("\n3. Testing Superposition")
print("-" * 60)
qc = QuantumCircuit(1)
qc.h(0).measure_all()

print("Circuit:")
print(qc.draw())

print("\nRunning circuit (1000 shots)...")
result = qc.run(shots=1000)

print("\nResults:")
print(f"|0⟩: {result.get_counts('0')} ({result.get_counts('0')/1000:.2%})")
print(f"|1⟩: {result.get_counts('1')} ({result.get_counts('1')/1000:.2%})")

# Test 4: Method Chaining
print("\n4. Testing Method Chaining")
print("-" * 60)
qc = QuantumCircuit(3)
qc.h(0).h(1).h(2).cx(0, 1).cx(1, 2).measure_all()

print("Circuit:")
print(qc.draw())

print("\nCircuit info:")
print(qc)

# Test 5: Statevector
print("\n5. Testing Statevector")
print("-" * 60)
qc = QuantumCircuit(2)
qc.h(0).cx(0, 1)

statevector = qc.get_statevector()
print("Statevector after Bell state preparation:")
for i, amp in enumerate(statevector):
    if abs(amp) > 0.01:
        bitstring = format(i, '02b')
        print(f"|{bitstring}⟩: {amp:.4f}")

print("\n" + "=" * 60)
print("ALL TESTS COMPLETED SUCCESSFULLY!")
print("=" * 60)