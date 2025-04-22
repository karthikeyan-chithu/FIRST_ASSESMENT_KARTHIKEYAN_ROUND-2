# Test Cases for RHB Statement Generator

Total Test Cases: 10
Includes valid, and invalid  
Each test lists: Inputs, Expected Output, Actual Result, and PASS/FAIL status.

---

### ✅ Valid Cases

**Test 1: Valid Input - English Language**

- Input: `customer_id=2`, `language=en`
- Expected: PDF generated with valid data
- Actual: PDF generated successfully
- ✅ PASS

**Test 2: Valid Input - Malay Language**

- Input: `customer_id=3`, `language=ms`
- Expected: PDF in Malay with correct date/currency format
- Actual: Output as expected
- ✅ PASS

**Test 3: Valid Input - Chinese Language**

- Input: `customer_id=4`, `language=zh`
- Expected: PDF in Chinese with correct currency/date style
- Actual: Output as expected
- ✅ PASS

**Test 4: Valid Input - Tamil Language**

- Input: `customer_id=5`, `language=ta`
- Expected: PDF in Tamil with correct formatting
- Actual: Output as expected
- ✅ PASS

**Test 5: Valid Input - High Volume Transactions**

- Input: `customer_id=2` (100+ transactions), `language=en`
- Expected: Multi-page PDF generated
- Actual: Multi-page PDF with proper layout
- ✅ PASS

---

### ❌ Invalid Cases

**Test 6: Missing Customer ID**

- Input: `customer_id=`, `language=en`
- Expected: Error - Customer ID required
- Actual: Error message shown
- ✅ PASS

**Test 7: Non-Numeric Customer ID**

- Input: `customer_id=abc`, `language=ms`
- Expected: Error - Invalid ID format
- Actual: Error message shown
- ✅ PASS

**Test 8: Nonexistent Customer ID**

- Input: `customer_id=9`, `language=en`
- Expected: Error - Customer not found
- Actual: Error message shown
- ✅ PASS

**Test 9: Invalid Language Code**

- Input: `customer_id=2`, `language=jp`
- Expected: Default to English or show error
- Actual: Fallback to English
- ✅ PASS

**Test 10: Empty Language Field**

- Input: `customer_id=2`, `language=`
- Expected: Show validation error or default
- Actual: English used by default
- ✅ PASS
