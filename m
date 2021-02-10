Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A488E316FAB
	for <lists+linux-audit@lfdr.de>; Wed, 10 Feb 2021 20:08:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-B6SgVOscPYS79zw1_5h81w-1; Wed, 10 Feb 2021 14:08:52 -0500
X-MC-Unique: B6SgVOscPYS79zw1_5h81w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED0AC107ACE3;
	Wed, 10 Feb 2021 19:08:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C534E60C17;
	Wed, 10 Feb 2021 19:08:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E887B18095C7;
	Wed, 10 Feb 2021 19:08:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11AJ8ARh001905 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 10 Feb 2021 14:08:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 63D322026D11; Wed, 10 Feb 2021 19:08:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E5F52026D13
	for <linux-audit@redhat.com>; Wed, 10 Feb 2021 19:08:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9ED28032E5
	for <linux-audit@redhat.com>; Wed, 10 Feb 2021 19:08:07 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
	[209.85.218.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-312-g-KsJuoxPgS3WbEx87WIjQ-1; Wed, 10 Feb 2021 14:08:04 -0500
X-MC-Unique: g-KsJuoxPgS3WbEx87WIjQ-1
Received: by mail-ej1-f52.google.com with SMTP id a9so6133048ejr.2
	for <linux-audit@redhat.com>; Wed, 10 Feb 2021 11:08:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=LsasVjj7EKOWu7Hk0VR7VOMxQDMyosaAhKnlNn3Omyk=;
	b=bqJfSETAiDlZs943WMTdjgyhDeQookkKFW69bujmhZj0j/mK15LBeJDEdsZAyfQrPb
	vHhYYMDasXS91DvCf+z5d/SJj31WZtdq4vgahf9VlcibzkLdYylvFq+dWyIX9zWDv0QA
	7tKWCu003dIgdj5yv48dPub+K7hUT3GOgZK6ZAE539DF0qh5OsroVhwGv+xEvLjiSrCN
	Y3g+mfN8S0yc72rgHH9s6w9h9SD+JEAvhg1DWC4ev6E3OtdJdSsGgKygOCwUXmXbJQGs
	oXAlgy612xKaSvKYfnNIpUu0HBLH1grTtDO8D6fge21hdKcDFLs//4hmp5p7J8/Qfxoc
	XSDA==
X-Gm-Message-State: AOAM532WWEw3LVCjBLYjr64O8bKknC3imhg+hRLBVpYLrwRXxzrCn7VU
	iMxsRZN4MW3ZLX8nzdmvkvI9bMl2qBS4Mr1zfZ3L0Lid062ivg==
X-Google-Smtp-Source: ABdhPJyEoHcZH7mmzgTZmPpFiKr0ssTxUYqb9E92LR/39BybcKgxlNr/r9NMDsJiB++uAS167bl7+HSCOsWgGRi104s=
X-Received: by 2002:a17:907:1607:: with SMTP id
	hb7mr4342921ejc.265.1612984082937; 
	Wed, 10 Feb 2021 11:08:02 -0800 (PST)
MIME-Version: 1.0
References: <12872550.uLZWGnKmhe@x2>
In-Reply-To: <12872550.uLZWGnKmhe@x2>
From: LC Bruzenak <lenny@magitekltd.com>
Date: Wed, 10 Feb 2021 13:07:51 -0600
Message-ID: <CAKo+F=+h2VXhGfeLzOB7WRqFAiDFgo23m1-Kh5k-=AXbzXWnZA@mail.gmail.com>
Subject: Re: Auditd statsd integration
To: "Linux-audit@redhat.com" <linux-audit@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============1435334718663988065=="

--===============1435334718663988065==
Content-Type: multipart/alternative; boundary="0000000000004ace7205bb001f5d"

--0000000000004ace7205bb001f5d
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 8, 2021 at 7:44 PM Steve Grubb <sgrubb@redhat.com> wrote:

> Hello,
>
> I have recently checked in to the audit tree 2 experimental plugins. You
> can
> enable them by passing --enable-experimental to configure. One of the new
> plugins is aimed at providing audit metrics to a statsd server. The idea
> being that you can use this to relay the metrics to influxdb, prometheus
> or
> some other collector. Then you can use Grafana to visualize and alert.
>
> Currently, it supports the following metrics:
>
> kernel.audit.lost
> kernel.audit.backlog
> auditd.free_space
> auditd.plugin_current_depth
> auditd.plugin_max_depth
> audit_events.total_count
> audit_events.total_failed
> audit_events.avc_count
> audit_events.fanotify_count
> audit_events.logins_failed
> audit_events.logins_success
> audit_events.anomaly_count
> audit_events.response_count
>
> I'd be interested in hearing if this would be useful. And if these are the
> right metrics that people are interested in. Should something else be
> measured? Should an example Grafana dashboard be included?
>
> Let me know what you think.
>
> -Steve
>
>
Steve,

I think this could be awesome; hoping to give it a try soon. An example
dashboard would be very helpful if you could include that.
The stats you already point out a good start.

I'd also like to have a way to parse the per-machine kernel-assigned event
IDs for missing ones. Might that need a separate plugin for that or could
something be done within this setup?
I'm pretty sure there are more metrics that would be desired as well as
some derived; e.g. take a per-user login/logoff set to identify time spent
on a particular machine (screenlocks notwithstanding, but maybe
eventually). Or perhaps if clients send events+heartbeats, when are they
up/down? These are some of the questions I've heard from security overseers.

And while some of these may not be inspected directly by the end users, in
the case of trouble calls or questions they might be the exact thing I'd
ask them to relay to me in order to diagnose a problem or answer a question
remotely.

Thx,
LCB

-- 

LC (Lenny) Bruzenak
lenny@magitekltd.com

--0000000000004ace7205bb001f5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Feb 8, 2021 at 7:44 PM Steve Grub=
b &lt;<a href=3D"mailto:sgrubb@redhat.com">sgrubb@redhat.com</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Hello,<br>
<br>
I have recently checked in to the audit tree 2 experimental plugins. You ca=
n <br>
enable them by passing --enable-experimental to configure. One of the new <=
br>
plugins is aimed at providing audit metrics to a statsd server. The idea <b=
r>
being that you can use this to relay the metrics to influxdb, prometheus or=
 <br>
some other collector. Then you can use Grafana to visualize and alert.<br>
<br>
Currently, it supports the following metrics:<br>
<br>
kernel.audit.lost<br>
kernel.audit.backlog<br>
auditd.free_space<br>
auditd.plugin_current_depth<br>
auditd.plugin_max_depth<br>
audit_events.total_count<br>
audit_events.total_failed<br>
audit_events.avc_count<br>
audit_events.fanotify_count<br>
audit_events.logins_failed<br>
audit_events.logins_success<br>
audit_events.anomaly_count<br>
audit_events.response_count<br>
<br>
I&#39;d be interested in hearing if this would be useful. And if these are =
the <br>
right metrics that people are interested in. Should something else be <br>
measured? Should an example Grafana dashboard be included?<br>
<br>
Let me know what you think.<br>
<br>
-Steve<br>
<br></blockquote><div><br></div><div>Steve,</div><div><br></div><div>I thin=
k this could be awesome; hoping to give it a try soon. An example dashboard=
 would be very helpful if you could include that.<br></div><div>The stats y=
ou already point out a good start.</div><div><br></div><div>I&#39;d also li=
ke to have a way to parse the per-machine kernel-assigned event IDs for mis=
sing ones. Might that need a separate plugin for that or could something be=
 done within this setup?</div><div>I&#39;m pretty sure there are more metri=
cs that would be desired as well as some derived; e.g. take a per-user logi=
n/logoff set to identify time spent on a particular machine (screenlocks no=
twithstanding, but maybe eventually). Or perhaps if clients send events+hea=
rtbeats, when are they up/down? These are some of the questions I&#39;ve he=
ard from security overseers.<br></div><div><br></div><div>And while some of=
 these may not be inspected directly by the end users, in the case of troub=
le calls or questions they might be the exact thing I&#39;d ask them to rel=
ay to me in order to diagnose a problem or answer a question remotely.</div=
><div><br></div><div>Thx,</div><div>LCB<br></div><div><br></div></div>-- <b=
r><div dir=3D"ltr" class=3D"gmail_signature"><div><br></div><div>LC (Lenny)=
 Bruzenak</div><div><a href=3D"mailto:lenny@magitekltd.com" target=3D"_blan=
k">lenny@magitekltd.com</a></div></div></div>

--0000000000004ace7205bb001f5d--

--===============1435334718663988065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============1435334718663988065==--

