resource "aws_codedeploy_app" "app" {
  name = "${var.stack_name}-${var.environment}"
}

resource "aws_codedeploy_deployment_config" "config" {
  deployment_config_name = "test-deployment-config"

  minimum_healthy_hosts {
    type  = "HOST_COUNT"
    value = 2
  }
}

resource "aws_codedeploy_deployment_group" "group" {
  app_name               = "${aws_codedeploy_app.app.name}"
  deployment_group_name  = "group"
  service_role_arn       = "${aws_iam_role.codedeploy_role.arn}"
  deployment_config_name = "${aws_codedeploy_deployment_config.config.id}"
  autoscaling_groups     = ["${var.asg_id}"]

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  alarm_configuration {
    alarms  = ["my-alarm-name"]
    enabled = true
  }
}
