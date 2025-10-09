# Contributing to Cirquit

Thank you for your interest in contributing to Cirquit! 🎉

We're building the future of quantum computing, and we'd love your help. Whether you're fixing bugs, adding features, improving documentation, or helping others in the community, every contribution matters.

---

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Pull Request Process](#pull-request-process)
- [Coding Standards](#coding-standards)
- [Testing Guidelines](#testing-guidelines)
- [Documentation](#documentation)
- [Community](#community)

---

## Code of Conduct

This project adheres to a Code of Conduct that we expect all contributors to follow. Please read [CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md) before contributing.

**TL;DR:** Be respectful, inclusive, and professional. We're all here to advance quantum computing.

---

## How Can I Contribute?

### 🐛 Reporting Bugs

Found a bug? Help us fix it!

**Before submitting:**
1. Check if the bug has already been reported in [Issues](https://github.com/cirquit/cirquit/issues)
2. Try the latest version from `main` branch
3. Verify it's actually a bug, not expected behavior

**When submitting:**
- Use our [bug report template](.github/ISSUE_TEMPLATE/bug_report.md)
- Include a minimal reproducible example
- Specify your Python version, OS, and Cirquit version
- Describe expected vs. actual behavior

**Example:**
```python
# Bug: CNOT gate doesn't work on non-adjacent qubits
from cirquit import QuantumCircuit

circuit = QuantumCircuit(3)
circuit.cnot(0, 2)  # Should work, but raises error
```

### ✨ Suggesting Features

Have an idea? We want to hear it!

**Good feature requests:**
- Solve a real problem you've experienced
- Include use cases and examples
- Consider implementation complexity
- Check our [roadmap](https://github.com/cirquit/cirquit/projects/1) first

Use our [feature request template](.github/ISSUE_TEMPLATE/feature_request.md).

### 📝 Improving Documentation

Documentation is as important as code!

**Ways to help:**
- Fix typos or unclear explanations
- Add missing docstrings
- Create tutorials or examples
- Improve API reference
- Translate to other languages (future)

### 🔧 Contributing Code

Ready to write code? Awesome!

**Good first issues:**
Look for issues labeled [`good first issue`](https://github.com/cirquit/cirquit/labels/good%20first%20issue) or [`help wanted`](https://github.com/cirquit/cirquit/labels/help%20wanted).

**Areas that need help:**
- Adding new quantum gates
- Optimizing simulator performance
- Writing tests
- Improving error messages
- Adding examples

---

## Development Setup

### Prerequisites

- Python 3.11 or higher
- Git
- (Optional) Virtual environment manager (venv, conda, poetry)

### Clone and Install

```bash
# Fork the repository on GitHub, then clone your fork
git clone https://github.com/YOUR_USERNAME/cirquit.git
cd cirquit

# Add upstream remote
git remote add upstream https://github.com/cirquit/cirquit.git

# Create virtual environment
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# Install in development mode with all dev dependencies
pip install -e ".[dev]"
```

### Verify Installation

```bash
# Run tests
pytest tests/ -v

# Should see all tests passing ✓
```

### Development Dependencies

Our `setup.py` includes:

```python
extras_require={
    'dev': [
        'pytest>=7.0.0',
        'pytest-cov>=4.0.0',
        'black>=23.0.0',
        'isort>=5.12.0',
        'mypy>=1.0.0',
        'pylint>=2.16.0',
        'flake8>=6.0.0',
    ]
}
```

---

## Pull Request Process

### 1. Create a Branch

```bash
# Update your main branch
git checkout main
git pull upstream main

# Create feature branch
git checkout -b feature/your-feature-name

# Or for bug fixes
git checkout -b fix/bug-description
```

**Branch naming:**
- `feature/` - New features
- `fix/` - Bug fixes
- `docs/` - Documentation
- `refactor/` - Code refactoring
- `test/` - Adding tests

### 2. Make Your Changes

- Write clean, readable code
- Follow our [coding standards](#coding-standards)
- Add tests for new functionality
- Update documentation as needed

### 3. Test Your Changes

```bash
# Run all tests
pytest tests/ -v

# Run with coverage
pytest tests/ --cov=cirquit --cov-report=html

# Check code style
black cirquit/ tests/
isort cirquit/ tests/
mypy cirquit/
pylint cirquit/
```

### 4. Commit Your Changes

Write clear, descriptive commit messages:

```bash
git add .
git commit -m "Add support for custom quantum gates

- Implement CustomGate class
- Add matrix validation
- Include tests and documentation
- Closes #123"
```

**Commit message format:**
```
<type>: <subject>

<body>

<footer>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `test`: Adding tests
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `chore`: Maintenance tasks

### 5. Push and Create PR

```bash
# Push to your fork
git push origin feature/your-feature-name
```

Then:
1. Go to GitHub and create a Pull Request
2. Fill out the PR template completely
3. Link related issues
4. Request review from maintainers

### 6. Code Review

- Respond to review comments promptly
- Make requested changes in new commits
- Push updates to the same branch
- Be open to feedback – we're all learning!

### 7. Merge

Once approved:
- Maintainer will merge your PR
- Your contribution will be in the next release 🎉
- You'll be added to CONTRIBUTORS.md

---

## Coding Standards

### Python Style Guide

We follow [PEP 8](https://pep8.org/) with some modifications:

**Line length:** 100 characters (not 79)

**Formatting:**
```bash
# Auto-format with Black
black cirquit/

# Sort imports
isort cirquit/
```

**Type hints:**
```python
from typing import List, Dict, Optional

def create_circuit(
    num_qubits: int,
    name: Optional[str] = None
) -> QuantumCircuit:
    """Create a quantum circuit.

    Args:
        num_qubits: Number of qubits in the circuit
        name: Optional name for the circuit

    Returns:
        A new QuantumCircuit instance
    """
    return QuantumCircuit(num_qubits, name=name)
```

**Docstrings:**

Use Google-style docstrings:

```python
def apply_gate(self, gate: Gate) -> 'QuantumCircuit':
    """Apply a quantum gate to the circuit.

    This method adds the specified gate to the circuit's gate list
    and returns self for method chaining.

    Args:
        gate: The quantum gate to apply

    Returns:
        Self for method chaining

    Raises:
        ValueError: If gate qubits are out of range

    Example:
        >>> circuit = QuantumCircuit(2)
        >>> circuit.apply_gate(Gate.H(0))
        >>> circuit.apply_gate(Gate.CNOT(0, 1))
    """
    self._validate_gate(gate)
    self.gates.append(gate)
    return self
```

### Code Organization

```
cirquit/
├── __init__.py          # Public API exports
├── circuit.py           # QuantumCircuit class
├── gates.py             # Gate definitions
├── simulator.py         # Simulation engine
├── results.py           # Result processing
├── visualization.py     # Circuit drawing
└── utils.py            # Utility functions

tests/
├── test_circuit.py
├── test_gates.py
├── test_simulator.py
└── fixtures/           # Test fixtures
```

### Performance Considerations

- Use NumPy for numerical operations
- Avoid Python loops for large arrays
- Cache expensive computations
- Profile before optimizing

```python
# Good: Vectorized operation
result = np.dot(matrix, vector)

# Bad: Python loop
result = np.zeros_like(vector)
for i in range(len(vector)):
    for j in range(len(matrix)):
        result[i] += matrix[i][j] * vector[j]
```

---

## Testing Guidelines

### Test Structure

```python
import pytest
from cirquit import QuantumCircuit

class TestQuantumCircuit:
    """Tests for QuantumCircuit class."""

    def test_circuit_creation(self):
        """Test basic circuit creation."""
        circuit = QuantumCircuit(2)
        assert circuit.num_qubits == 2
        assert len(circuit.gates) == 0

    def test_hadamard_gate(self):
        """Test Hadamard gate application."""
        circuit = QuantumCircuit(1)
        circuit.h(0)
        assert len(circuit.gates) == 1
        assert circuit.gates[0].gate_type == GateType.H

    def test_invalid_qubit_raises_error(self):
        """Test that invalid qubit raises ValueError."""
        circuit = QuantumCircuit(2)
        with pytest.raises(ValueError, match="out of range"):
            circuit.h(5)
```

### Test Coverage

Aim for **>90% test coverage**:

```bash
pytest tests/ --cov=cirquit --cov-report=term-missing
```

### Test Types

**Unit tests:** Test individual functions/methods
```python
def test_gate_matrix():
    matrix = get_gate_matrix(GateType.H)
    expected = np.array([[1, 1], [1, -1]]) / np.sqrt(2)
    np.testing.assert_array_almost_equal(matrix, expected)
```

**Integration tests:** Test multiple components
```python
def test_full_circuit_execution():
    circuit = QuantumCircuit(2)
    circuit.h(0).cnot(0, 1).measure_all()
    result = circuit.run(shots=1000)
    assert '00' in result.counts
    assert '11' in result.counts
```

**Performance tests:** Test speed/memory
```python
@pytest.mark.slow
def test_large_circuit_performance():
    import time
    circuit = QuantumCircuit(20)
    # ... build circuit ...
    start = time.time()
    result = circuit.run(shots=1000)
    duration = time.time() - start
    assert duration < 30.0  # Should complete in 30s
```

### Fixtures

Use fixtures for common setup:

```python
@pytest.fixture
def bell_circuit():
    """Fixture providing a Bell state circuit."""
    circuit = QuantumCircuit(2)
    circuit.h(0)
    circuit.cnot(0, 1)
    circuit.measure_all()
    return circuit

def test_bell_state(bell_circuit):
    result = bell_circuit.run(shots=1000)
    # Test the result...
```

---

## Documentation

### Docstring Requirements

Every public function/class needs a docstring:

```python
def calculate_fidelity(state1: np.ndarray, state2: np.ndarray) -> float:
    """Calculate fidelity between two quantum states.

    The fidelity is a measure of similarity between quantum states,
    ranging from 0 (orthogonal) to 1 (identical).

    Args:
        state1: First quantum state vector
        state2: Second quantum state vector

    Returns:
        Fidelity value between 0 and 1

    Raises:
        ValueError: If states have different dimensions

    Example:
        >>> state1 = np.array([1, 0])
        >>> state2 = np.array([1, 0])
        >>> calculate_fidelity(state1, state2)
        1.0

    References:
        Nielsen & Chuang, "Quantum Computation and Quantum Information",
        Section 9.2.2
    """
    if len(state1) != len(state2):
        raise ValueError("States must have same dimension")
    return float(np.abs(np.dot(state1.conj(), state2)) ** 2)
```

### Documentation Site

We use Sphinx for our docs. To build locally:

```bash
cd docs/
pip install -r requirements.txt
make html
open _build/html/index.html
```

### Adding Examples

Add examples to `examples/` directory:

```python
"""
Bell State Example
==================

This example demonstrates creating quantum entanglement
using a Bell state circuit.

Learn more: https://en.wikipedia.org/wiki/Bell_state
"""

from cirquit import QuantumCircuit

def main():
    # Create circuit
    circuit = QuantumCircuit(2, name="bell_state")

    # Apply gates
    circuit.h(0)
    circuit.cnot(0, 1)
    circuit.measure_all()

    # Run and analyze
    result = circuit.run(shots=1000)
    print(f"Results: {result.counts}")

if __name__ == "__main__":
    main()
```

---

## Community

### Getting Help

- 💬 **Discord**: [discord.gg/cirquit](https://discord.gg/cirquit)
- 📧 **Email**: developers@cirquit.io
- 💡 **Discussions**: [GitHub Discussions](https://github.com/cirquit/cirquit/discussions)

### Recognition

Contributors are recognized in:
- CONTRIBUTORS.md file
- Release notes
- Annual contributor awards
- Conference shoutouts

---

## Questions?

Still have questions? We're here to help!

- Open a [Discussion](https://github.com/cirquit/cirquit/discussions)
- Ask in [Discord](https://discord.gg/cirquit)
- Email us at developers@cirquit.io

**Thank you for contributing to Cirquit! Together, we're making quantum computing accessible to everyone.** 🚀⚛️