<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>IT Service Request | Service Desk</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: #f4f7fb;
            color: #1f2937;
            min-height: 100vh;
        }

        /* TOP HEADER */
        .header {
            background: #173f67;
            color: white;
            padding: 22px 8%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 3px 12px rgba(0,0,0,0.12);
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .brand-icon {
            width: 42px;
            height: 42px;
            background: #ffffff;
            color: #173f67;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 22px;
            font-weight: bold;
        }

        .brand h1 {
            font-size: 20px;
            font-weight: 600;
        }

        .brand p {
            font-size: 12px;
            opacity: 0.8;
            margin-top: 3px;
        }

        .header-status {
            font-size: 13px;
            background: rgba(255,255,255,0.12);
            padding: 8px 14px;
            border-radius: 20px;
        }

        .status-dot {
            display: inline-block;
            width: 8px;
            height: 8px;
            background: #4ade80;
            border-radius: 50%;
            margin-right: 6px;
        }

        /* MAIN AREA */
        .main {
            max-width: 900px;
            margin: 45px auto;
            padding: 0 20px;
        }

        .intro {
            text-align: center;
            margin-bottom: 28px;
        }

        .intro h2 {
            font-size: 30px;
            color: #173f67;
            margin-bottom: 8px;
        }

        .intro p {
            color: #64748b;
            font-size: 14px;
        }

        /* FORM CARD */
        .card {
            background: white;
            border-radius: 14px;
            padding: 35px;
            box-shadow: 0 8px 30px rgba(31, 55, 80, 0.10);
            border: 1px solid #e5eaf0;
        }

        .section-title {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #173f67;
            font-size: 17px;
            font-weight: 600;
            padding-bottom: 14px;
            margin-bottom: 24px;
            border-bottom: 1px solid #e7edf3;
        }

        .section-number {
            width: 28px;
            height: 28px;
            background: #e8f0f8;
            color: #173f67;
            border-radius: 7px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 13px;
            font-weight: bold;
        }

        /* TWO COLUMN FORM */
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 22px;
        }

        .form-group {
            margin-bottom: 4px;
        }

        .full-width {
            grid-column: 1 / -1;
        }

        label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #374151;
            margin-bottom: 8px;
        }

        .required {
            color: #dc2626;
        }

        input[type="text"],
        select,
        textarea {
            width: 100%;
            border: 1px solid #d5dde6;
            border-radius: 8px;
            padding: 12px 14px;
            font-family: inherit;
            font-size: 14px;
            color: #1f2937;
            background: #fbfcfe;
            outline: none;
            transition: all 0.2s ease;
        }

        input[type="text"]:focus,
        select:focus,
        textarea:focus {
            border-color: #2d6da3;
            background: white;
            box-shadow: 0 0 0 3px rgba(45,109,163,0.10);
        }

        input[type="text"]::placeholder,
        textarea::placeholder {
            color: #9ca3af;
        }

        textarea {
            min-height: 130px;
            resize: vertical;
        }

        select {
            cursor: pointer;
        }

        /* PRIORITY */
        .priority-options {
            display: flex;
            gap: 12px;
        }

        .priority-option {
            flex: 1;
            position: relative;
        }

        .priority-option input {
            position: absolute;
            opacity: 0;
        }

        .priority-label {
            display: block;
            text-align: center;
            padding: 11px 10px;
            border: 1px solid #d5dde6;
            border-radius: 8px;
            background: #fbfcfe;
            cursor: pointer;
            font-size: 13px;
            font-weight: 500;
            transition: all 0.2s ease;
        }

        .priority-option input:checked + .priority-label {
            border-color: #173f67;
            background: #eaf2f9;
            color: #173f67;
            font-weight: 600;
        }

        .priority-label:hover {
            border-color: #8ba9c2;
        }

        /* BUTTON AREA */
        .button-area {
            margin-top: 30px;
            padding-top: 24px;
            border-top: 1px solid #e7edf3;
            display: flex;
            justify-content: flex-end;
            gap: 12px;
        }

        .submit-btn {
            border: none;
            background: #173f67;
            color: white;
            padding: 13px 30px;
            border-radius: 8px;
            font-family: inherit;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .submit-btn:hover {
            background: #0f3153;
            transform: translateY(-1px);
            box-shadow: 0 5px 12px rgba(23,63,103,0.22);
        }

        .submit-btn:active {
            transform: translateY(0);
        }

        /* FOOTER */
        .footer {
            text-align: center;
            color: #94a3b8;
            font-size: 12px;
            margin-top: 25px;
            padding-bottom: 30px;
        }

        /* RESPONSIVE */
        @media (max-width: 700px) {

            .header {
                padding: 18px 20px;
            }

            .header-status {
                display: none;
            }

            .main {
                margin-top: 30px;
            }

            .intro h2 {
                font-size: 24px;
            }

            .card {
                padding: 24px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .full-width {
                grid-column: auto;
            }

            .priority-options {
                flex-direction: column;
            }

            .button-area {
                display: block;
            }

            .submit-btn {
                width: 100%;
            }
        }

    </style>

</head>

<body>

    <!-- HEADER -->

    <header class="header">

        <div class="brand">

            <div class="brand-icon">
                IT
            </div>

            <div>
                <h1>IT Service Desk</h1>
                <p>Employee Support Portal</p>
            </div>

        </div>

        <div class="header-status">
            <span class="status-dot"></span>
            Support Online
        </div>

    </header>


    <!-- MAIN CONTENT -->

    <main class="main">

        <div class="intro">

            <h2>Submit a Service Request</h2>

            <p>
                Tell us about your issue and our support team will assist you.
            </p>

        </div>


        <!-- FORM CARD -->

        <div class="card">

            <div class="section-title">

                <span class="section-number">
                    01
                </span>

                Request Information

            </div>


            <form action="Controller" method="post">


                <div class="form-grid">


                    <!-- EMPLOYEE ID -->

                    <div class="form-group">

                        <label for="employeeId">
                            Employee ID
                            <span class="required">*</span>
                        </label>

                        <input
                            type="text"
                            id="employeeId"
                            name="employeeId"
                            placeholder="Enter employee ID"
                            required>

                    </div>


                    <!-- EMPLOYEE NAME -->

                    <div class="form-group">

                        <label for="employeeName">
                            Employee Name
                            <span class="required">*</span>
                        </label>

                        <input
                            type="text"
                            id="employeeName"
                            name="employeeName"
                            placeholder="Enter full name"
                            required>

                    </div>


                    <!-- DEPARTMENT -->

                    <div class="form-group">

                        <label for="department">
                            Department
                            <span class="required">*</span>
                        </label>

                        <select
                            id="department"
                            name="department"
                            required>

                            <option value="">
                                Select department
                            </option>

                            <option value="HR">
                                Human Resources
                            </option>

                            <option value="IT">
                                Information Technology
                            </option>

                            <option value="Finance">
                                Finance
                            </option>

                            <option value="Marketing">
                                Marketing
                            </option>

                            <option value="Operations">
                                Operations
                            </option>

                        </select>

                    </div>


                    <!-- CATEGORY -->

                    <div class="form-group">

                        <label for="category">
                            Problem Category
                            <span class="required">*</span>
                        </label>

                        <select
                            id="category"
                            name="category"
                            required>

                            <option value="">
                                Select problem category
                            </option>

                            <option value="Network">
                                Network
                            </option>

                            <option value="Software">
                                Software
                            </option>

                            <option value="Hardware">
                                Hardware
                            </option>

                            <option value="Account">
                                Account
                            </option>

                            <option value="Other">
                                Other
                            </option>

                        </select>

                    </div>


                    <!-- DESCRIPTION -->

                    <div class="form-group full-width">

                        <label for="description">
                            Problem Description
                            <span class="required">*</span>
                        </label>

                        <textarea
                            id="description"
                            name="description"
                            placeholder="Please describe the problem in detail..."
                            required></textarea>

                    </div>


                    <!-- PRIORITY -->

                    <div class="form-group full-width">

                        <label>
                            Priority
                            <span class="required">*</span>
                        </label>

                        <div class="priority-options">


                            <div class="priority-option">

                                <input
                                    type="radio"
                                    id="low"
                                    name="priority"
                                    value="Low"
                                    required>

                                <label
                                    class="priority-label"
                                    for="low">

                                    Low

                                </label>

                            </div>


                            <div class="priority-option">

                                <input
                                    type="radio"
                                    id="medium"
                                    name="priority"
                                    value="Medium">

                                <label
                                    class="priority-label"
                                    for="medium">

                                    Medium

                                </label>

                            </div>


                            <div class="priority-option">

                                <input
                                    type="radio"
                                    id="high"
                                    name="priority"
                                    value="High">

                                <label
                                    class="priority-label"
                                    for="high">

                                    High

                                </label>

                            </div>


                        </div>

                    </div>


                </div>


                <!-- SUBMIT -->

                <div class="button-area">

                    <button
                        type="submit"
                        class="submit-btn">

                        Submit Service Request

                    </button>

                </div>


            </form>

        </div>


        <div class="footer">

            IT Service Desk &nbsp;•&nbsp;
            Employee Support Portal

        </div>

    </main>

</body>
</html>