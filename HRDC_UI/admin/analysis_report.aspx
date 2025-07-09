<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Report Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        /* Statistics Cards */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
        }

        .stat-card {
            background: linear-gradient(135deg, #3b82f6, #1d4ed8);
            color: white;
            border-radius: 12px;
            padding: 25px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        .stat-title {
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 10px;
            opacity: 0.9;
        }

        .stat-number {
            font-size: 32px;
            font-weight: bold;
            margin: 0;
        }

        /* Mask Group Label */
        .mask-group {
            margin-bottom: 30px;
        }

        .mask-group-label {
            display: inline-block;
            background: white;
            padding: 10px 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            font-size: 16px;
            font-weight: 500;
            color: #6b7280;
        }

        /* Charts Section */
        .charts-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
            gap: 30px;
        }

        .chart-container {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease;
        }

        .chart-container:hover {
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        .chart-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .chart-title {
            font-size: 24px;
            font-weight: bold;
            color: #1f2937;
            margin: 0;
        }

        .chart-dropdown {
            background: #f9fafb;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            padding: 8px 12px;
            font-size: 14px;
            outline: none;
            transition: border-color 0.3s ease;
        }

        .chart-dropdown:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }

        .chart-content {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 200px;
        }

        .pie-chart {
            position: relative;
        }

        .pie-chart svg {
            width: 200px;
            height: 200px;
        }

        .pie-chart circle {
            transition: all 0.3s ease-in-out;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            body {
                padding: 10px;
            }

            .stats-grid {
                grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
                gap: 15px;
            }

            .stat-card {
                padding: 20px;
            }

            .stat-number {
                font-size: 24px;
            }

            .charts-grid {
                grid-template-columns: 1fr;
                gap: 20px;
            }

            .chart-container {
                padding: 20px;
            }

            .chart-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .chart-title {
                font-size: 20px;
            }

            .pie-chart svg {
                width: 150px;
                height: 150px;
            }
        }

        @media (max-width: 480px) {
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .stat-card {
                padding: 15px;
            }

            .stat-title {
                font-size: 12px;
            }

            .stat-number {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Header Stats Cards -->
            <div class="stats-grid">
                <!-- Seminar Card -->
                <div class="stat-card">
                    <h3 class="stat-title">Seminar</h3>
                    <p class="stat-number">
                        <asp:Label ID="lblSeminarCount" runat="server" Text="6"></asp:Label>
                    </p>
                </div>

                <!-- Technical Staff Card -->
                <div class="stat-card">
                    <h3 class="stat-title">Technical Staff</h3>
                    <p class="stat-number">
                        <asp:Label ID="lblTechnicalStaff" runat="server" Text="20"></asp:Label>
                    </p>
                </div>

                <!-- Non-Technical Staff Card -->
                <div class="stat-card">
                    <h3 class="stat-title">Non-Technical Staff</h3>
                    <p class="stat-number">
                        <asp:Label ID="lblNonTechnicalStaff" runat="server" Text="10"></asp:Label>
                    </p>
                </div>

                <!-- Total Staff Card -->
                <div class="stat-card">
                    <h3 class="stat-title">Total Staff</h3>
                    <p class="stat-number">
                        <asp:Label ID="lblTotalStaff" runat="server" Text="30"></asp:Label>
                    </p>
                </div>
            </div>

            <!-- Mask Group Label -->
            <div class="mask-group">
                <span class="mask-group-label">🎭 Mask group</span>
            </div>

            <!-- Charts Section -->
            <div class="charts-grid">
                <!-- Attendance Chart -->
                <div class="chart-container">
                    <div class="chart-header">
                        <h3 class="chart-title">Attendance</h3>
                        <asp:DropDownList ID="ddlAttendanceFilter" runat="server" CssClass="chart-dropdown">
                            <asp:ListItem Text="All" Value="all" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Today" Value="today"></asp:ListItem>
                            <asp:ListItem Text="This Week" Value="week"></asp:ListItem>
                            <asp:ListItem Text="This Month" Value="month"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="chart-content">
                        <div class="pie-chart">
                            <svg width="200" height="200" viewBox="0 0 200 200">
                                <!-- Background circle -->
                                <circle cx="100" cy="100" r="80" fill="none" stroke="#e5e7eb" stroke-width="40"/>
                                <!-- Data circle (80% filled) -->
                                <circle cx="100" cy="100" r="80" fill="none" stroke="#3b82f6" stroke-width="40" 
                                        stroke-dasharray="402.12 100.53" stroke-dashoffset="0" 
                                        transform="rotate(-90 100 100)"/>
                            </svg>
                        </div>
                    </div>
                </div>

                <!-- Feedback Chart -->
                <div class="chart-container">
                    <div class="chart-header">
                        <h3 class="chart-title">Feedback</h3>
                        <asp:DropDownList ID="ddlFeedbackFilter" runat="server" CssClass="chart-dropdown">
                            <asp:ListItem Text="All" Value="all" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Positive" Value="positive"></asp:ListItem>
                            <asp:ListItem Text="Negative" Value="negative"></asp:ListItem>
                            <asp:ListItem Text="Neutral" Value="neutral"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="chart-content">
                        <div class="pie-chart">
                            <svg width="200" height="200" viewBox="0 0 200 200">
                                <!-- Background circle -->
                                <circle cx="100" cy="100" r="80" fill="none" stroke="#e5e7eb" stroke-width="40"/>
                                <!-- Data circle (70% filled) -->
                                <circle cx="100" cy="100" r="80" fill="none" stroke="#10b981" stroke-width="40" 
                                        stroke-dasharray="351.86 150.8" stroke-dashoffset="0" 
                                        transform="rotate(-90 100 100)"/>
                            </svg>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>