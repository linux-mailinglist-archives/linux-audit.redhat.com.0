Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D874975E5CA
	for <lists+linux-audit@lfdr.de>; Mon, 24 Jul 2023 02:09:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690157360;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=GUJh9Sn3aF7MWFE3a8AmydHIqxCU5tOADx3KjTCpX0A=;
	b=RKPWUmG1uI1IstZOCVSDUcQhpwH9nlLKxWdP0BENq4WG8PPAffLpYWicqs7YKziwwOWNDs
	V2EsU9b8JTlWw8qrJcKoBuYpPBM1pi9ES1hi2A6wqKeYb0C/vHE9y7VcPiFTkpjq7cNCcC
	Jr4IRohMZ0EIC61pwOzPretqjOH2isQ=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-Ba759h3KOFGce2AeV_Mq4w-1; Sun, 23 Jul 2023 20:09:16 -0400
X-MC-Unique: Ba759h3KOFGce2AeV_Mq4w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DE7A3806060;
	Mon, 24 Jul 2023 00:09:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 884F11121314;
	Mon, 24 Jul 2023 00:09:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 51FE319451D5;
	Mon, 24 Jul 2023 00:08:45 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 910AA19465B6 for <linux-audit@listman.corp.redhat.com>;
 Thu, 29 Jun 2023 22:34:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7DC3E492C13; Thu, 29 Jun 2023 22:34:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 769864CD0C2
 for <linux-audit@redhat.com>; Thu, 29 Jun 2023 22:34:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 584D3185A795
 for <linux-audit@redhat.com>; Thu, 29 Jun 2023 22:34:18 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-MpM_KdcnO5io-oEaioPTJQ-1; Thu, 29 Jun 2023 18:34:16 -0400
X-MC-Unique: MpM_KdcnO5io-oEaioPTJQ-1
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2b6a084a34cso19072281fa.1
 for <linux-audit@redhat.com>; Thu, 29 Jun 2023 15:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688078054; x=1690670054;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oNzG0Pnqqn6yVvqgNXOQ7fEBW/l/SlyY+2hKWyeg5K4=;
 b=Y4VQnk4Phu2fKHzVmXMXgCwv+t5D/fVOnGWi9bRZkaqaOV1xIcgoT/FKwdhreIEsTz
 qBnr2xFCv8T8mjkfXUrXJr3a/XHTGkWI7ih00cS3R0WrS1hd4JbaPypEBA0W3JE2Wocj
 b7oEM61cOKXxeuSQO09uOqqRZkIyOfY1nOXRrDi/KqSEO/83krNCb3/MCVybrWu6J2hq
 I/K5MPbNianrnKWgpSXsIo436xiHsCsWeTUSj8ttCwTFTDx/MqrxStUe8pPLUadGI21K
 5y/28tAtjeR+qLxzlsl0hojSF8iGmPkTTXf8+TJ8OZgQ9ueN10ZJToAUoArN/H0nNJCP
 ja/Q==
X-Gm-Message-State: ABy/qLbQPYymSdeR2WZNiH4lezqzN4t3P5QyCuKc/QsvzgCGYBFXs9vt
 qcuzMorhQKqdfxEkFywWdjCsxvjld0ohCy6yxU+ikW6yaPULz5mgrpg=
X-Google-Smtp-Source: APBJJlEN3fMDUzM3zf26Mge0jpO8r6u5BfwOeCTZT+S76XpgyI7WqM01HFrQ09y8ItmgZ+nQ9TVNZOar46F5dCfY4aM=
X-Received: by 2002:a05:651c:1030:b0:2b6:cdfb:d06a with SMTP id
 w16-20020a05651c103000b002b6cdfbd06amr749105ljm.22.1688078053838; Thu, 29 Jun
 2023 15:34:13 -0700 (PDT)
MIME-Version: 1.0
From: Samuel Bahr <sbahr@pinterest.com>
Date: Thu, 29 Jun 2023 17:34:03 -0500
Message-ID: <CAG0SdGBHWZCDTHrx-OthDoJ6O==RqSzH3yvAEzmQLT=iYHZhSw@mail.gmail.com>
Subject: Cannot disable kernel's audit system via auditctl
To: linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Mon, 24 Jul 2023 00:08:43 +0000
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
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: pinterest.com
Content-Type: multipart/mixed; boundary="===============8792915135381254125=="

--===============8792915135381254125==
Content-Type: multipart/alternative; boundary="000000000000c0b3c305ff4c4c45"

--000000000000c0b3c305ff4c4c45
Content-Type: text/plain; charset="UTF-8"

Hi linux-audit,

I'm running a fleet of Linux hosts with Red Canary Linux EDR (Endpoint
Detection and Response) which uses eBPF for gathering telemetry in service `
cfsvcd.service`. In an older configuration, it gathered data from the
kernel's audit system and everything was fine. However, when we switched
cfsvcd to gathering data from eBPF instead, we noticed that the kernel ring
buffer was flooded with audit messages. This is because cfsvcd.service now
stops auditd.service, but leaves the kernel audit system enabled.

I've mitigated this issue by manually running `# auditctl -e 0` on our
hosts (via Puppet). However, I'm running into a strange issue where _some_
hosts (~0.5%) are still logging all audit events to the kernel ring buffer
even after I have disabled the audit system via `# auditctl -e 0`. A `#
auditctl -s` run shows `enabled 0`, yet audit logs continue to flood the
kernel ring buffer.

I'm running Linux kernel 5.4.0-1063-aws on Ubuntu 18.04 with auditctl
v2.8.2. `systemd-journald-audit.socket` is masked & inactive, `
auditd.service` is disabled & inactive.

I cannot entirely disable the audit system via a kernel parameter because
Red Canary Linux EDR fails to start cfsvcd.service as it fails to run some
auditctl command due to no audit support in the kernel:

Jun 28 20:41:04 systemd[1]: Started Canary Forwarder Service.
> Jun 28 20:41:04 cfsvcd[105781]: Found config file at path
> '"/opt/redcanary/config.json"', continuing execution...
> Jun 28 20:41:12 cfsvcd[105781]: component: Sentry
> Jun 28 20:41:12 cfsvcd[105781]:  Jun 28 20:41:12.055 INFO Initializing
> Sentry Config { version: "1.4.17.release.[...]", https_proxy: None,
> extra_tags: [("telemetry.source", "eBPF")], logging_enabled: true,
> metrics_enabled: true, [...]}
> Jun 28 20:41:12 cfsvcd[105781]: Failed to setup or configure host system:
> Linux Audit watcher failure: Netlink Error: IO Error: Protocol not
> supported (os error 93)
> Jun 28 20:41:12 cfsvcd[105781]: Received stop. Exiting
> unix::wait_for_signal. Signal: 0, done.is_signaled(): true
> Jun 28 20:41:12 cfsvcd[105781]: Joining async_agent_thread
> Jun 28 20:41:13 cfsvcd[105781]: Attempting to stop subscriber (Ebpf).
> Jun 28 20:41:13 cfsvcd[105781]: Shutting down due to termination signal
> [...]
> Jun 28 20:41:15 cfsvcd[105781]: Subscriber stopped.
> Jun 28 20:41:15 auditctl[106733]: Error - audit support not in kernel
> Jun 28 20:41:15 auditctl[106733]: Cannot open netlink audit socket
> Jun 28 20:41:15 systemd[1]: cfsvcd.service: Service hold-off time over,
> scheduling restart.
> Jun 28 20:41:15 systemd[1]: cfsvcd.service: Scheduled restart job, restart
> counter is at 301.
> Jun 28 20:41:15 systemd[1]: Stopped Canary Forwarder Service.
>

Here's the unit file for cfsvcd.service:

> [Unit]
> Description=Canary Forwarder Service
>
> DefaultDependencies=no
> After=local-fs.target systemd-tmpfiles-setup.service auditd.service
> Before=sysinit.target shutdown.target
> # Replace the auditd service if it is running
> Conflicts=auditd.service shutdown.target
>
> [Service]
> WorkingDirectory=/opt/redcanary
> ExecStart=/opt/redcanary/cfsvcd
> ExecStopPost=-/sbin/auditctl -D
> Restart=always
> TimeoutSec=15
>
> [Install]
> WantedBy=multi-user.target
>

Is this a known issue? Is there a workaround to stop the logging to the
kernel ring buffer? Is there any more information I can provide to help
debug?

Thanks,
Samuel Bahr
Pinterest Sr. Site Reliability Engineer

--000000000000c0b3c305ff4c4c45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi linux-audit,<div><br></div><div>I&#39;m running a fleet=
 of Linux hosts with Red Canary Linux EDR (Endpoint Detection and Response)=
 which uses eBPF for gathering telemetry in=C2=A0service `<font face=3D"mon=
ospace" style=3D"background-color:rgb(238,238,238)">cfsvcd.service</font>`.=
 In an older configuration, it gathered data from the kernel&#39;s audit sy=
stem and everything was fine. However, when we switched cfsvcd to gathering=
 data from eBPF instead, we noticed that the kernel ring buffer was flooded=
 with audit messages. This is because cfsvcd.service now stops auditd.servi=
ce, but leaves the kernel audit system enabled.</div><div><br></div><div>I&=
#39;ve=C2=A0mitigated this issue by manually running `<font face=3D"monospa=
ce" style=3D"background-color:rgb(238,238,238)"># auditctl -e 0</font>` on =
our hosts (via Puppet). However, I&#39;m running into a strange issue where=
 _some_ hosts (~0.5%) are still logging all audit events to the kernel ring=
 buffer even after I have disabled the audit system via `<font face=3D"mono=
space" style=3D"background-color:rgb(238,238,238)"># auditctl -e 0</font>`.=
 A `<font face=3D"monospace" style=3D"background-color:rgb(238,238,238)"># =
auditctl -s</font>` run shows `<font face=3D"monospace" style=3D"background=
-color:rgb(238,238,238)">enabled 0</font>`, yet audit logs continue to floo=
d the kernel ring buffer.</div><div><br></div><div>I&#39;m running Linux ke=
rnel 5.4.0-1063-aws on Ubuntu 18.04 with auditctl v2.8.2. `<font face=3D"mo=
nospace" style=3D"background-color:rgb(238,238,238)">systemd-journald-audit=
.socket</font>` is masked &amp; inactive, `<font face=3D"monospace" style=
=3D"background-color:rgb(238,238,238)">auditd.service</font>` is disabled &=
amp; inactive.</div><div><br></div><div>I cannot entirely disable the audit=
 system via a kernel parameter because Red Canary Linux EDR fails to start =
cfsvcd.service as it fails to run some auditctl command due to no audit sup=
port in the kernel:</div><div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><font face=3D"monospace">Jun 28 20:41:04 systemd[1]: Started=
 Canary Forwarder Service.<br>Jun 28 20:41:04 cfsvcd[105781]: Found config =
file at path &#39;&quot;/opt/redcanary/config.json&quot;&#39;, continuing e=
xecution...<br>Jun 28 20:41:12 cfsvcd[105781]: component: Sentry<br>Jun 28 =
20:41:12 cfsvcd[105781]: =C2=A0Jun 28 20:41:12.055 INFO Initializing Sentry=
 Config { version: &quot;1.4.17.release.[...]&quot;, https_proxy: None, ext=
ra_tags: [(&quot;telemetry.source&quot;, &quot;eBPF&quot;)], logging_enable=
d: true, metrics_enabled: true, [...]}<br>Jun 28 20:41:12 cfsvcd[105781]: F=
ailed to setup or configure host system: Linux Audit watcher failure: Netli=
nk Error: IO Error: Protocol not supported (os error 93)<br>Jun 28 20:41:12=
 cfsvcd[105781]: Received stop. Exiting unix::wait_for_signal. Signal: 0, d=
one.is_signaled(): true<br>Jun 28 20:41:12 cfsvcd[105781]: Joining async_ag=
ent_thread<br>Jun 28 20:41:13 cfsvcd[105781]: Attempting to stop subscriber=
 (Ebpf).<br>Jun 28 20:41:13 cfsvcd[105781]: Shutting down due to terminatio=
n signal<br>[...]<br>Jun 28 20:41:15 cfsvcd[105781]: Subscriber stopped.<br=
>Jun 28 20:41:15 auditctl[106733]: Error - audit support not in kernel<br>J=
un 28 20:41:15 auditctl[106733]: Cannot open netlink audit socket<br>Jun 28=
 20:41:15 systemd[1]: cfsvcd.service: Service hold-off time over, schedulin=
g restart.<br>Jun 28 20:41:15 systemd[1]: cfsvcd.service: Scheduled restart=
 job, restart counter is at 301.<br>Jun 28 20:41:15 systemd[1]: Stopped Can=
ary Forwarder Service.</font><br></blockquote><div><br></div><div>Here&#39;=
s the unit file for cfsvcd.service:</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><font face=3D"monospace">[Unit]<br>Description=3DCanary For=
warder Service<br><br>DefaultDependencies=3Dno<br>After=3Dlocal-fs.target s=
ystemd-tmpfiles-setup.service auditd.service<br>Before=3Dsysinit.target shu=
tdown.target<br># Replace the auditd service if it is running<br>Conflicts=
=3Dauditd.service shutdown.target<br><br>[Service]<br>WorkingDirectory=3D/o=
pt/redcanary<br>ExecStart=3D/opt/redcanary/cfsvcd<br>ExecStopPost=3D-/sbin/=
auditctl -D<br>Restart=3Dalways<br>TimeoutSec=3D15<br><br>[Install]<br>Want=
edBy=3Dmulti-user.target</font><br></blockquote><div><br></div><div>Is this=
 a known issue? Is there a workaround to stop the logging to the kernel rin=
g buffer? Is there any more information I can provide to help debug?</div><=
div><br></div><div>Thanks,</div><div>Samuel Bahr</div><div>Pinterest Sr. Si=
te Reliability Engineer</div></div>

--000000000000c0b3c305ff4c4c45--

--===============8792915135381254125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============8792915135381254125==--

