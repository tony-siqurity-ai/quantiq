---
title: "Introducing Cirquit v1.1.0"
date: 2025-10-09
author: Tony Rossi
---

# Introducing Cirquit

Today we're launching Cirquit v1.1.0 - a complete quantum computing platform.

## Why Cirquit?

Quantum computing is powerful but complex. Cirquit makes it simple.

## Quick Example

Install and create your first quantum circuit:

pip install cirquit

from cirquit import QuantumCircuit

qc = QuantumCircuit(2)
qc.h(0).cx(0, 1).measure_all()
result = qc.run(shots=1000)

## What's Next

We're building cloud execution, real hardware backends, and more algorithms.

Join our community to share ideas!
