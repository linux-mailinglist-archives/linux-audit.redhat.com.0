Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 75001761863
	for <lists+linux-audit@lfdr.de>; Tue, 25 Jul 2023 14:31:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690288266;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=245cPF2FFsyq7gyFo8fwcW++a0NcsMahUypJGp8XW5M=;
	b=eHQYvXyyYPErU0wOyroQxgX29rRprBGX3CunY1Ekufm7ZexBc9YAWbPUArSwPM3xTBrh+/
	/EstLAiforRV+WFdtEwzMjN3tqPhwEuCGkjhbiTe3DZH23k6dLbO9KVT8yp7AlpqrJ/qjv
	Clv6/ZClg3//YRrcBXULbmWvsdUbT3M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-SMnHJZ1ZNVSdVxQxYfi6SQ-1; Tue, 25 Jul 2023 08:31:02 -0400
X-MC-Unique: SMnHJZ1ZNVSdVxQxYfi6SQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64BBA805C10;
	Tue, 25 Jul 2023 12:30:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D562201EE6E;
	Tue, 25 Jul 2023 12:30:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 01B7C1946A6D;
	Tue, 25 Jul 2023 12:30:49 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AB9AC1946589 for <linux-audit@listman.corp.redhat.com>;
 Mon, 24 Jul 2023 21:06:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 965D240C2070; Mon, 24 Jul 2023 21:06:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C62440C2063
 for <linux-audit@redhat.com>; Mon, 24 Jul 2023 21:06:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D2B11C0515F
 for <linux-audit@redhat.com>; Mon, 24 Jul 2023 21:06:17 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-mhIBKpFpOFeDv8q2tJAQsw-1; Mon, 24 Jul 2023 17:06:14 -0400
X-MC-Unique: mhIBKpFpOFeDv8q2tJAQsw-1
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2b701e41cd3so68671331fa.3
 for <linux-audit@redhat.com>; Mon, 24 Jul 2023 14:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690232773; x=1690837573;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pAHrw9VFEfRJSJqSVU9w/Owxs7QBxG5jIeYJCY2ee/s=;
 b=eEzptMUOGZF6MNc2JTmiZ8KWo/Ep3T2GwfzZX6D748ns7U/Jsv+WvUsYBV0/Hv9YjN
 z+jhNpiI/oU6wbYb9WbqLybm6iR4Hzx1HAJDNnoHGeKEQVclqEPxFpU82Z4PzYuZr7C5
 shDTO0GGF2D5Xfro4MWK4OYKfZgI65AiaGymO8DUtPk7ZJ/gF4PyXzv+p9AZ8WdEM/Fq
 dEwBYMt+fDQqzIfcWY7egCxjK/Y5i3dzYzTVuBPa2Jk0VyBGaLZvK8BD3g2odx9S8VVC
 HWibcxua/1/ZXPvPJV79u3uvYZMofsxSrVq+/cRnntFAaHB2AiS3niCmIVJoIZt3S46t
 gbEQ==
X-Gm-Message-State: ABy/qLZIVJV122+aXqWMIUSxZoTLgCEF+Vg1Xk0Pkdg5/P7AGTypbW1Q
 CzDc9EHPXrj/j1FmTC+BUHjdTnhnStFszwfKhUcHaQ==
X-Google-Smtp-Source: APBJJlHiZUP+pLijEXo4xxWG5mIYD5+KXeJC5py9zsOEQwH7vkh8F9rOXpStd6fPUUgkJ1MDekCd1irIC2KSqgxqtE4=
X-Received: by 2002:a2e:9b0b:0:b0:2b6:e719:324e with SMTP id
 u11-20020a2e9b0b000000b002b6e719324emr6427355lji.49.1690232773219; Mon, 24
 Jul 2023 14:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAG0SdGBHWZCDTHrx-OthDoJ6O==RqSzH3yvAEzmQLT=iYHZhSw@mail.gmail.com>
 <2691760.mvXUDI8C0e@x2>
In-Reply-To: <2691760.mvXUDI8C0e@x2>
From: Samuel Bahr <sbahr@pinterest.com>
Date: Mon, 24 Jul 2023 16:06:02 -0500
Message-ID: <CAG0SdGBHnFLf=DDMwvyYyctfq3YcA3RUzuEibMdDbxTCuwFxZA@mail.gmail.com>
Subject: Re: Cannot disable kernel's audit system via auditctl
To: Steve Grubb <sgrubb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Tue, 25 Jul 2023 12:30:47 +0000
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
Cc: linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: pinterest.com
Content-Type: multipart/mixed; boundary="===============6575469510284832286=="

--===============6575469510284832286==
Content-Type: multipart/alternative; boundary="000000000000097b93060141fc39"

--000000000000097b93060141fc39
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

`auditctl -D` does not make it go away (outputs `No rules`). auditd isn't
running at all and this behavior is happening purely from the kernel. These
systems were never set to enabled 2 (locked).

I went ahead and filed a Github issue for this thread:
https://github.com/linux-audit/audit-kernel/issues/146

The maintainer there suggested it's too difficult to debug due to eBPF
programs + AWS's modified kernel. I've resigned to asking Red Canary to
support eBPF mode with `audit=3D0` kernel parameter in their Linux EDR. Let
me know if you have any other ideas.

Regards,
Samuel Bahr
Pinterest Sr. Site Reliability Engineer

On Sun, Jul 23, 2023 at 7:17=E2=80=AFPM Steve Grubb <sgrubb@redhat.com> wro=
te:

> On Thursday, June 29, 2023 6:34:03 PM EDT Samuel Bahr wrote:
> > Hi linux-audit,
> >
> > I'm running a fleet of Linux hosts with Red Canary Linux EDR (Endpoint
> > Detection and Response) which uses eBPF for gathering telemetry in
> service
> > ` cfsvcd.service`. In an older configuration, it gathered data from the
> > kernel's audit system and everything was fine. However, when we switche=
d
> > cfsvcd to gathering data from eBPF instead, we noticed that the kernel
> > ring buffer was flooded with audit messages. This is because
> > cfsvcd.service now stops auditd.service, but leaves the kernel audit
> > system enabled.
> >
> > I've mitigated this issue by manually running `# auditctl -e 0` on our
> > hosts (via Puppet). However, I'm running into a strange issue where
> _some_
> > hosts (~0.5%) are still logging all audit events to the kernel ring
> buffer
> > even after I have disabled the audit system via `# auditctl -e 0`. A `#
> > auditctl -s` run shows `enabled 0`, yet audit logs continue to flood th=
e
> > kernel ring buffer.
> >
> > I'm running Linux kernel 5.4.0-1063-aws on Ubuntu 18.04 with auditctl
> > v2.8.2. `systemd-journald-audit.socket` is masked & inactive, `
> > auditd.service` is disabled & inactive.
> >
> > I cannot entirely disable the audit system via a kernel parameter becau=
se
> > Red Canary Linux EDR fails to start cfsvcd.service as it fails to run
> some
> > auditctl command due to no audit support in the kernel:
> >
> > Jun 28 20:41:04 systemd[1]: Started Canary Forwarder Service.
> >
> > > Jun 28 20:41:04 cfsvcd[105781]: Found config file at path
> > > '"/opt/redcanary/config.json"', continuing execution...
> > > Jun 28 20:41:12 cfsvcd[105781]: component: Sentry
> > > Jun 28 20:41:12 cfsvcd[105781]:  Jun 28 20:41:12.055 INFO Initializin=
g
> > > Sentry Config { version: "1.4.17.release.[...]", https_proxy: None,
> > > extra_tags: [("telemetry.source", "eBPF")], logging_enabled: true,
> > > metrics_enabled: true, [...]}
> > > Jun 28 20:41:12 cfsvcd[105781]: Failed to setup or configure host
> system:
> > > Linux Audit watcher failure: Netlink Error: IO Error: Protocol not
> > > supported (os error 93)
> > > Jun 28 20:41:12 cfsvcd[105781]: Received stop. Exiting
> > > unix::wait_for_signal. Signal: 0, done.is_signaled(): true
> > > Jun 28 20:41:12 cfsvcd[105781]: Joining async_agent_thread
> > > Jun 28 20:41:13 cfsvcd[105781]: Attempting to stop subscriber (Ebpf).
> > > Jun 28 20:41:13 cfsvcd[105781]: Shutting down due to termination sign=
al
> > > [...]
> > > Jun 28 20:41:15 cfsvcd[105781]: Subscriber stopped.
> > > Jun 28 20:41:15 auditctl[106733]: Error - audit support not in kernel
> > > Jun 28 20:41:15 auditctl[106733]: Cannot open netlink audit socket
> > > Jun 28 20:41:15 systemd[1]: cfsvcd.service: Service hold-off time ove=
r,
> > > scheduling restart.
> > > Jun 28 20:41:15 systemd[1]: cfsvcd.service: Scheduled restart job,
> > > restart
> > > counter is at 301.
> > > Jun 28 20:41:15 systemd[1]: Stopped Canary Forwarder Service.
> >
> > Here's the unit file for cfsvcd.service:
> > > [Unit]
> > > Description=3DCanary Forwarder Service
> > >
> > > DefaultDependencies=3Dno
> > > After=3Dlocal-fs.target systemd-tmpfiles-setup.service auditd.service
> > > Before=3Dsysinit.target shutdown.target
> > > # Replace the auditd service if it is running
> > > Conflicts=3Dauditd.service shutdown.target
> > >
> > > [Service]
> > > WorkingDirectory=3D/opt/redcanary
> > > ExecStart=3D/opt/redcanary/cfsvcd
> > > ExecStopPost=3D-/sbin/auditctl -D
> > > Restart=3Dalways
> > > TimeoutSec=3D15
> > >
> > > [Install]
> > > WantedBy=3Dmulti-user.target
> >
> > Is this a known issue?
>
> Not really. But this is a new capability. If you run auditctl -D, does it
> go
> away? Have any of the systems been setup with auditctl -e 2? This makes
> the
> configuration immutable.
>
> -Steve
>
> > Is there a workaround to stop the logging to the
> > kernel ring buffer? Is there any more information I can provide to help
> > debug?
>
>
>
>

--000000000000097b93060141fc39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Steve,=C2=A0<div><br></div><div>`auditctl -D` does not =
make it go away (outputs `No rules`). auditd isn&#39;t running at all and t=
his behavior is happening purely from the kernel. These systems were never =
set to enabled 2 (locked).</div><div><br></div><div>I went ahead and filed =
a Github issue for this thread:=C2=A0<a href=3D"https://github.com/linux-au=
dit/audit-kernel/issues/146">https://github.com/linux-audit/audit-kernel/is=
sues/146</a></div><div><br></div><div>The maintainer there suggested it&#39=
;s too difficult to debug due to eBPF programs=C2=A0+ AWS&#39;s modified ke=
rnel. I&#39;ve resigned to asking Red Canary to support eBPF mode with `aud=
it=3D0` kernel parameter in their Linux EDR. Let me know if you have any ot=
her ideas.</div><div><br></div><div>Regards,</div><div>Samuel Bahr</div><di=
v>Pinterest Sr. Site Reliability Engineer</div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 23, 2023 at 7:17=
=E2=80=AFPM Steve Grubb &lt;<a href=3D"mailto:sgrubb@redhat.com">sgrubb@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Thursday, June 29, 2023 6:34:03 PM EDT Samuel Bahr wrote:<br>
&gt; Hi linux-audit,<br>
&gt; <br>
&gt; I&#39;m running a fleet of Linux hosts with Red Canary Linux EDR (Endp=
oint<br>
&gt; Detection and Response) which uses eBPF for gathering telemetry in ser=
vice<br>
&gt; ` cfsvcd.service`. In an older configuration, it gathered data from th=
e<br>
&gt; kernel&#39;s audit system and everything was fine. However, when we sw=
itched<br>
&gt; cfsvcd to gathering data from eBPF instead, we noticed that the kernel=
<br>
&gt; ring buffer was flooded with audit messages. This is because<br>
&gt; cfsvcd.service now stops auditd.service, but leaves the kernel audit<b=
r>
&gt; system enabled.<br>
&gt; <br>
&gt; I&#39;ve mitigated this issue by manually running `# auditctl -e 0` on=
 our<br>
&gt; hosts (via Puppet). However, I&#39;m running into a strange issue wher=
e _some_<br>
&gt; hosts (~0.5%) are still logging all audit events to the kernel ring bu=
ffer<br>
&gt; even after I have disabled the audit system via `# auditctl -e 0`. A `=
#<br>
&gt; auditctl -s` run shows `enabled 0`, yet audit logs continue to flood t=
he<br>
&gt; kernel ring buffer.<br>
&gt; <br>
&gt; I&#39;m running Linux kernel 5.4.0-1063-aws on Ubuntu 18.04 with audit=
ctl<br>
&gt; v2.8.2. `systemd-journald-audit.socket` is masked &amp; inactive, `<br=
>
&gt; auditd.service` is disabled &amp; inactive.<br>
&gt; <br>
&gt; I cannot entirely disable the audit system via a kernel parameter beca=
use<br>
&gt; Red Canary Linux EDR fails to start cfsvcd.service as it fails to run =
some<br>
&gt; auditctl command due to no audit support in the kernel:<br>
&gt; <br>
&gt; Jun 28 20:41:04 systemd[1]: Started Canary Forwarder Service.<br>
&gt; <br>
&gt; &gt; Jun 28 20:41:04 cfsvcd[105781]: Found config file at path<br>
&gt; &gt; &#39;&quot;/opt/redcanary/config.json&quot;&#39;, continuing exec=
ution...<br>
&gt; &gt; Jun 28 20:41:12 cfsvcd[105781]: component: Sentry<br>
&gt; &gt; Jun 28 20:41:12 cfsvcd[105781]:=C2=A0 Jun 28 20:41:12.055 INFO In=
itializing<br>
&gt; &gt; Sentry Config { version: &quot;1.4.17.release.[...]&quot;, https_=
proxy: None,<br>
&gt; &gt; extra_tags: [(&quot;telemetry.source&quot;, &quot;eBPF&quot;)], l=
ogging_enabled: true,<br>
&gt; &gt; metrics_enabled: true, [...]}<br>
&gt; &gt; Jun 28 20:41:12 cfsvcd[105781]: Failed to setup or configure host=
 system:<br>
&gt; &gt; Linux Audit watcher failure: Netlink Error: IO Error: Protocol no=
t<br>
&gt; &gt; supported (os error 93)<br>
&gt; &gt; Jun 28 20:41:12 cfsvcd[105781]: Received stop. Exiting<br>
&gt; &gt; unix::wait_for_signal. Signal: 0, done.is_signaled(): true<br>
&gt; &gt; Jun 28 20:41:12 cfsvcd[105781]: Joining async_agent_thread<br>
&gt; &gt; Jun 28 20:41:13 cfsvcd[105781]: Attempting to stop subscriber (Eb=
pf).<br>
&gt; &gt; Jun 28 20:41:13 cfsvcd[105781]: Shutting down due to termination =
signal<br>
&gt; &gt; [...]<br>
&gt; &gt; Jun 28 20:41:15 cfsvcd[105781]: Subscriber stopped.<br>
&gt; &gt; Jun 28 20:41:15 auditctl[106733]: Error - audit support not in ke=
rnel<br>
&gt; &gt; Jun 28 20:41:15 auditctl[106733]: Cannot open netlink audit socke=
t<br>
&gt; &gt; Jun 28 20:41:15 systemd[1]: cfsvcd.service: Service hold-off time=
 over,<br>
&gt; &gt; scheduling restart.<br>
&gt; &gt; Jun 28 20:41:15 systemd[1]: cfsvcd.service: Scheduled restart job=
,<br>
&gt; &gt; restart<br>
&gt; &gt; counter is at 301.<br>
&gt; &gt; Jun 28 20:41:15 systemd[1]: Stopped Canary Forwarder Service.<br>
&gt; <br>
&gt; Here&#39;s the unit file for cfsvcd.service:<br>
&gt; &gt; [Unit]<br>
&gt; &gt; Description=3DCanary Forwarder Service<br>
&gt; &gt; <br>
&gt; &gt; DefaultDependencies=3Dno<br>
&gt; &gt; After=3Dlocal-fs.target systemd-tmpfiles-setup.service auditd.ser=
vice<br>
&gt; &gt; Before=3Dsysinit.target shutdown.target<br>
&gt; &gt; # Replace the auditd service if it is running<br>
&gt; &gt; Conflicts=3Dauditd.service shutdown.target<br>
&gt; &gt; <br>
&gt; &gt; [Service]<br>
&gt; &gt; WorkingDirectory=3D/opt/redcanary<br>
&gt; &gt; ExecStart=3D/opt/redcanary/cfsvcd<br>
&gt; &gt; ExecStopPost=3D-/sbin/auditctl -D<br>
&gt; &gt; Restart=3Dalways<br>
&gt; &gt; TimeoutSec=3D15<br>
&gt; &gt; <br>
&gt; &gt; [Install]<br>
&gt; &gt; WantedBy=3Dmulti-user.target<br>
&gt; <br>
&gt; Is this a known issue?<br>
<br>
Not really. But this is a new capability. If you run auditctl -D, does it g=
o <br>
away? Have any of the systems been setup with auditctl -e 2? This makes the=
 <br>
configuration immutable.<br>
<br>
-Steve<br>
<br>
&gt; Is there a workaround to stop the logging to the<br>
&gt; kernel ring buffer? Is there any more information I can provide to hel=
p<br>
&gt; debug?<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000097b93060141fc39--

--===============6575469510284832286==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============6575469510284832286==--

