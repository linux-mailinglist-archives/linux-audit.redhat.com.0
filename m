Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4694B75E5CE
	for <lists+linux-audit@lfdr.de>; Mon, 24 Jul 2023 02:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690157838;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Mn0cOyF8z7RF0RUYPrb80HJLFYTvjnK7BcRhbcKGSbI=;
	b=IMIHoJXjhJ+ozArWWUiop7whgflhMldOZGaQMNiSMaNheRjYep7uHxTcXL/iGqBjuESZ9t
	LKwtONRLoC4GC0+wY+Y4x1qRm49CEr32P4e8k+QYY04ONBYTgHSLkaQwG2Jc9z7aLfhXUl
	Mf96P5TzgAD1p5HFPQKOmWWvEfDdHlY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-4Be7JMRUN8yZcYhTc_RJkg-1; Sun, 23 Jul 2023 20:17:14 -0400
X-MC-Unique: 4Be7JMRUN8yZcYhTc_RJkg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F87E10113C7;
	Mon, 24 Jul 2023 00:17:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7555446A3A7;
	Mon, 24 Jul 2023 00:17:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DFCCC19451D4;
	Mon, 24 Jul 2023 00:17:10 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 143011946588 for <linux-audit@listman.corp.redhat.com>;
 Mon, 24 Jul 2023 00:17:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9E6171454142; Mon, 24 Jul 2023 00:17:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.16.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 750261454143;
 Mon, 24 Jul 2023 00:17:08 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Cannot disable kernel's audit system via auditctl
Date: Sun, 23 Jul 2023 20:17:07 -0400
Message-ID: <2691760.mvXUDI8C0e@x2>
Organization: Red Hat
In-Reply-To: <CAG0SdGBHWZCDTHrx-OthDoJ6O==RqSzH3yvAEzmQLT=iYHZhSw@mail.gmail.com>
References: <CAG0SdGBHWZCDTHrx-OthDoJ6O==RqSzH3yvAEzmQLT=iYHZhSw@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: Samuel Bahr <sbahr@pinterest.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, June 29, 2023 6:34:03 PM EDT Samuel Bahr wrote:
> Hi linux-audit,
> 
> I'm running a fleet of Linux hosts with Red Canary Linux EDR (Endpoint
> Detection and Response) which uses eBPF for gathering telemetry in service
> ` cfsvcd.service`. In an older configuration, it gathered data from the
> kernel's audit system and everything was fine. However, when we switched
> cfsvcd to gathering data from eBPF instead, we noticed that the kernel
> ring buffer was flooded with audit messages. This is because
> cfsvcd.service now stops auditd.service, but leaves the kernel audit
> system enabled.
> 
> I've mitigated this issue by manually running `# auditctl -e 0` on our
> hosts (via Puppet). However, I'm running into a strange issue where _some_
> hosts (~0.5%) are still logging all audit events to the kernel ring buffer
> even after I have disabled the audit system via `# auditctl -e 0`. A `#
> auditctl -s` run shows `enabled 0`, yet audit logs continue to flood the
> kernel ring buffer.
> 
> I'm running Linux kernel 5.4.0-1063-aws on Ubuntu 18.04 with auditctl
> v2.8.2. `systemd-journald-audit.socket` is masked & inactive, `
> auditd.service` is disabled & inactive.
> 
> I cannot entirely disable the audit system via a kernel parameter because
> Red Canary Linux EDR fails to start cfsvcd.service as it fails to run some
> auditctl command due to no audit support in the kernel:
> 
> Jun 28 20:41:04 systemd[1]: Started Canary Forwarder Service.
> 
> > Jun 28 20:41:04 cfsvcd[105781]: Found config file at path
> > '"/opt/redcanary/config.json"', continuing execution...
> > Jun 28 20:41:12 cfsvcd[105781]: component: Sentry
> > Jun 28 20:41:12 cfsvcd[105781]:  Jun 28 20:41:12.055 INFO Initializing
> > Sentry Config { version: "1.4.17.release.[...]", https_proxy: None,
> > extra_tags: [("telemetry.source", "eBPF")], logging_enabled: true,
> > metrics_enabled: true, [...]}
> > Jun 28 20:41:12 cfsvcd[105781]: Failed to setup or configure host system:
> > Linux Audit watcher failure: Netlink Error: IO Error: Protocol not
> > supported (os error 93)
> > Jun 28 20:41:12 cfsvcd[105781]: Received stop. Exiting
> > unix::wait_for_signal. Signal: 0, done.is_signaled(): true
> > Jun 28 20:41:12 cfsvcd[105781]: Joining async_agent_thread
> > Jun 28 20:41:13 cfsvcd[105781]: Attempting to stop subscriber (Ebpf).
> > Jun 28 20:41:13 cfsvcd[105781]: Shutting down due to termination signal
> > [...]
> > Jun 28 20:41:15 cfsvcd[105781]: Subscriber stopped.
> > Jun 28 20:41:15 auditctl[106733]: Error - audit support not in kernel
> > Jun 28 20:41:15 auditctl[106733]: Cannot open netlink audit socket
> > Jun 28 20:41:15 systemd[1]: cfsvcd.service: Service hold-off time over,
> > scheduling restart.
> > Jun 28 20:41:15 systemd[1]: cfsvcd.service: Scheduled restart job,
> > restart
> > counter is at 301.
> > Jun 28 20:41:15 systemd[1]: Stopped Canary Forwarder Service.
> 
> Here's the unit file for cfsvcd.service:
> > [Unit]
> > Description=Canary Forwarder Service
> > 
> > DefaultDependencies=no
> > After=local-fs.target systemd-tmpfiles-setup.service auditd.service
> > Before=sysinit.target shutdown.target
> > # Replace the auditd service if it is running
> > Conflicts=auditd.service shutdown.target
> > 
> > [Service]
> > WorkingDirectory=/opt/redcanary
> > ExecStart=/opt/redcanary/cfsvcd
> > ExecStopPost=-/sbin/auditctl -D
> > Restart=always
> > TimeoutSec=15
> > 
> > [Install]
> > WantedBy=multi-user.target
> 
> Is this a known issue?

Not really. But this is a new capability. If you run auditctl -D, does it go 
away? Have any of the systems been setup with auditctl -e 2? This makes the 
configuration immutable.

-Steve

> Is there a workaround to stop the logging to the
> kernel ring buffer? Is there any more information I can provide to help
> debug?



--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

