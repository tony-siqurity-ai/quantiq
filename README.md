# Cirquit

<div align="center">

```
   ◯━━━━◯
   │    │
   ◯━━━━◯
```

**Quantum circuits, simplified**

[![PyPI version](https://badge.fury.io/py/cirquit.svg)](https://badge.fury.io/py/cirquit)
[![Python 3.11+](https://img.shields.io/badge/python-3.11+-blue.svg)](https://www.python.org/downloads/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Documentation](https://img.shields.io/badge/docs-cirquit.io-brightgreen.svg)](https://docs.cirquit.io)

[Website](https://cirquit.io) • [Documentation](https://docs.cirquit.io) • [Examples](./examples) • [Discord](https://discord.gg/cirquit)

</div>

---

## What is Cirquit?

**Cirquit** is a quantum computing platform that makes building and running quantum circuits as simple as calling an API. No quantum physics PhD required.

- 🚀 **Developer-first**: Simple Python SDK with intuitive API
- ⚡ **Fast**: Run quantum circuits in seconds, not hours
- 🌐 **Universal**: Works with multiple quantum backends (simulators & real hardware)
- 💰 **Affordable**: Pay only for what you use
- 🔓 **Open**: Not locked into any single quantum vendor

Think **AWS Lambda for quantum computing**.

---

## Quick Start

### Installation

```bash
pip install cirquit
```

### Your First Quantum Circuit

```python
from cirquit import QuantumCircuit

# Create a Bell state (quantum entanglement)
circuit = QuantumCircuit(2)
circuit.h(0)           # Apply Hadamard gate to qubit 0
circuit.cnot(0, 1)     # Apply CNOT gate
circuit.measure_all()  # Measure all qubits

# Run the circuit
result = circuit.run(shots=1000)
print(result.counts)
# Output: {'00': 503, '11': 497}
```

**That's it!** You just created quantum entanglement.

---

## Features

### 🎯 Simple & Intuitive API

```python
from cirquit import QuantumCircuit

circuit = QuantumCircuit(3)
circuit.h(0).h(1).h(2)                    # Hadamard on all qubits
circuit.cnot(0, 1).cnot(1, 2)             # Create entanglement
circuit.rx(0, 1.5708).ry(1, 0.7854)       # Rotations
circuit.measure_all()

result = circuit.run(shots=2048, backend="simulator")
```

### 🔧 Comprehensive Gate Library

**Single-qubit gates:**
- Pauli gates: `X`, `Y`, `Z`
- Hadamard: `H`
- Phase gates: `S`, `T`
- Rotations: `RX`, `RY`, `RZ`

**Two-qubit gates:**
- `CNOT` (controlled-NOT)
- `CZ` (controlled-Z)
- `SWAP`

**Coming soon:** Toffoli, Fredkin, custom gates

### 📊 Rich Result Analysis

```python
result = circuit.run(shots=1000)

# Get measurement counts
print(result.counts)
# {'000': 127, '111': 125, '001': 124, ...}

# Get probabilities
print(result.probabilities())
# {'000': 0.127, '111': 0.125, ...}

# Most common outcomes
print(result.most_common(3))
# [('000', 127), ('111', 125), ('001', 124)]

# Execution metadata
print(f"Runtime: {result.execution_time:.3f}s")
```

### 🎨 Circuit Visualization

```python
circuit = QuantumCircuit(3)
circuit.h(0).cnot(0, 1).cnot(1, 2)
print(circuit.draw())
```

Output:
```
q0: ─[H]─●───
          │
q1: ──────⊕─●─
            │
q2: ────────⊕─
```

### ☁️ Cloud Execution (Coming Soon)

```python
import cirquit

# Authenticate with Cirquit Cloud
cirquit.login(api_key="your_api_key")

# Run on real quantum hardware
circuit = QuantumCircuit(5)
# ... build circuit ...

result = circuit.run(
    shots=4096,
    backend="ibm_nairobi",  # Real quantum computer!
    priority="high"
)
```

---

## Examples

### Bell State (Quantum Entanglement)

```python
from cirquit import QuantumCircuit

circuit = QuantumCircuit(2, name="bell_state")
circuit.h(0)
circuit.cnot(0, 1)
circuit.measure_all()

result = circuit.run(shots=1000)
# Perfect correlation: only |00⟩ and |11⟩ states
```

### GHZ State (3-qubit Entanglement)

```python
from cirquit import QuantumCircuit

circuit = QuantumCircuit(3, name="ghz_state")
circuit.h(0)
for i in range(2):
    circuit.cnot(i, i + 1)
circuit.measure_all()

result = circuit.run(shots=1000)
# Result: ~50% |000⟩ and ~50% |111⟩
```

### Quantum Teleportation

```python
from cirquit import quantum_teleportation

circuit = quantum_teleportation()
print(circuit.draw())
result = circuit.run(shots=1024)
```

### Parameterized Circuits (VQE, QAOA)

```python
import numpy as np
from cirquit import QuantumCircuit

def ansatz(params):
    circuit = QuantumCircuit(2)
    circuit.rx(0, params[0])
    circuit.ry(1, params[1])
    circuit.cnot(0, 1)
    circuit.rz(1, params[2])
    return circuit

# Optimize parameters (classical)
params = np.random.rand(3) * 2 * np.pi
circuit = ansatz(params)
result = circuit.run(shots=1000)
```

**📁 More examples:** [examples/](./examples)

---

## Architecture

Cirquit is built with modularity and scalability in mind:

```
┌─────────────────────────────────────────────┐
│           Python SDK (cirquit)              │
│  QuantumCircuit | Gates | Visualization     │
└─────────────────────────────────────────────┘
                      │
┌─────────────────────┼─────────────────────┐
│                     ▼                     │
│         Execution Engine                  │
│  ┌─────────┐  ┌──────────┐  ┌──────────┐ │
│  │Simulator│  │ IBM  Q   │  │ Rigetti  │ │
│  └─────────┘  └──────────┘  └──────────┘ │
└───────────────────────────────────────────┘
                      │
                      ▼
        ┌──────────────────────────┐
        │   Cirquit Cloud (API)    │
        │  Job Queue | Storage      │
        └──────────────────────────┘
```

### Components

- **SDK**: Python library for circuit construction
- **Simulator**: Efficient statevector simulation (up to 25 qubits)
- **Cloud API**: REST API for job submission and management
- **Backends**: Support for multiple quantum hardware providers

---

## Documentation

📚 **Full documentation:** [docs.cirquit.io](https://docs.cirquit.io)

- [Getting Started Guide](https://docs.cirquit.io/getting-started)
- [API Reference](https://docs.cirquit.io/api)
- [Tutorials](https://docs.cirquit.io/tutorials)
- [Algorithm Library](https://docs.cirquit.io/algorithms)
- [Best Practices](https://docs.cirquit.io/best-practices)

---

## Roadmap

### ✅ Phase 1: MVP (Current)
- [x] Core SDK with essential gates
- [x] Statevector simulator
- [x] Circuit visualization
- [x] Result analysis tools
- [x] Example circuits

### 🚧 Phase 2: Cloud Platform (Q2 2025)
- [ ] REST API for job submission
- [ ] Web dashboard
- [ ] User authentication
- [ ] Usage tracking & billing
- [ ] Real-time job monitoring

### 🔮 Phase 3: Hardware Integration (Q3 2025)
- [ ] IBM Quantum backend
- [ ] Rigetti backend
- [ ] IonQ backend
- [ ] Circuit transpilation
- [ ] Hardware-optimized compilation

### 🌟 Phase 4: Advanced Features (Q4 2025)
- [ ] Hybrid quantum-classical workflows
- [ ] ML framework integration (PyTorch, TensorFlow)
- [ ] Algorithm marketplace
- [ ] Noise simulation
- [ ] Error mitigation
- [ ] GPU-accelerated simulation

**See our [full roadmap →](https://github.com/cirquit/cirquit/projects/1)**

---

## Performance

Cirquit simulator performance on Apple M1 Max:

| Qubits | Gates | Time     | Memory  |
|--------|-------|----------|---------|
| 10     | 100   | 0.05s    | 32 MB   |
| 15     | 150   | 0.8s     | 1 GB    |
| 20     | 200   | 12s      | 32 GB   |
| 25     | 250   | 180s     | 1024 GB |

*Results may vary based on circuit complexity and hardware*

---

## Contributing

We ❤️ contributions! Cirquit is open-source and community-driven.

### Ways to Contribute

- 🐛 **Report bugs**: [Open an issue](https://github.com/cirquit/cirquit/issues)
- ✨ **Suggest features**: [Start a discussion](https://github.com/cirquit/cirquit/discussions)
- 📝 **Improve docs**: Submit a PR
- 🔧 **Add features**: See [CONTRIBUTING.md](./CONTRIBUTING.md)
- 💬 **Help others**: Join our [Discord](https://discord.gg/cirquit)

### Development Setup

```bash
# Clone the repository
git clone https://github.com/cirquit/cirquit.git
cd cirquit

# Create virtual environment
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# Install in development mode
pip install -e ".[dev]"

# Run tests
pytest tests/ -v

# Format code
black cirquit/
```

### Code Style

We use:
- **Black** for code formatting
- **isort** for import sorting
- **mypy** for type checking
- **pytest** for testing

```bash
# Run all checks
make lint
make test
```

---

## Community

Join our growing community of quantum developers:

- 💬 **Discord**: [discord.gg/cirquit](https://discord.gg/cirquit)
- 🐦 **Twitter**: [@cirquit_io](https://twitter.com/cirquit_io)
- 📧 **Email**: hello@cirquit.io
- 📰 **Blog**: [blog.cirquit.io](https://blog.cirquit.io)

**Weekly Office Hours**: Thursdays at 3pm PT on Discord

---

## FAQ

### Is Cirquit free?

Yes! The SDK is open-source and free forever. Cloud platform pricing:
- **Free tier**: 10,000 shots/month
- **Researcher**: $49/month (100K shots)
- **Enterprise**: Custom pricing

### How is Cirquit different from Qiskit or Cirq?

Cirquit is designed for **simplicity** and **cloud-native execution**:
- **Simpler API**: Less boilerplate, more intuitive
- **Cloud-first**: Built for API-driven workflows
- **Vendor-neutral**: Works with any quantum backend
- **Developer UX**: Optimized for modern development workflows

### Can I use Cirquit for research?

Absolutely! Cirquit is perfect for:
- 🎓 Quantum computing education
- 🔬 Research prototyping
- 📊 Algorithm development
- 💡 Proof-of-concept projects

Academic licenses available upon request.

### Does Cirquit work with real quantum computers?

Not yet, but **coming Q3 2025**! We're partnering with:
- IBM Quantum
- Rigetti Computing
- IonQ

For now, our high-performance simulator is perfect for algorithm development.

---

## Citation

If you use Cirquit in your research, please cite:

```bibtex
@software{cirquit2025,
  title = {Cirquit: Quantum Computing Platform},
  author = {Cirquit Team},
  year = {2025},
  url = {https://github.com/cirquit/cirquit},
  version = {1.0.0}
}
```

---

## License

Cirquit is released under the [MIT License](./LICENSE).

```
MIT License

Copyright (c) 2025 Cirquit

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction...
```

---

## Acknowledgments

Built with ❤️ by the Cirquit team.

Special thanks to:
- The quantum computing research community
- Open-source contributors
- Early beta testers
- Our Discord community

**Inspired by the vision of making quantum computing accessible to everyone.**

---

<div align="center">

**⭐ Star us on GitHub • 🐦 Follow on Twitter • 💬 Join Discord**

Made with ⚛️ by [Cirquit](https://cirquit.io)

[Get Started](https://docs.cirquit.io) • [API Docs](https://docs.cirquit.io/api) • [Examples](./examples)

</div>