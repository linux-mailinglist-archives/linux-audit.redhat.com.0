Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id DF8AA316FC1
	for <lists+linux-audit@lfdr.de>; Wed, 10 Feb 2021 20:12:50 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-bVP5JURQOYGagC73qHH7FA-1; Wed, 10 Feb 2021 14:12:46 -0500
X-MC-Unique: bVP5JURQOYGagC73qHH7FA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C362A801962;
	Wed, 10 Feb 2021 19:12:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 469711001E73;
	Wed, 10 Feb 2021 19:12:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41CF94EBC6;
	Wed, 10 Feb 2021 19:12:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11AJCEXA003512 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 10 Feb 2021 14:12:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0216A2166B2E; Wed, 10 Feb 2021 19:12:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F05842166B2F
	for <linux-audit@redhat.com>; Wed, 10 Feb 2021 19:12:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42823858F1B
	for <linux-audit@redhat.com>; Wed, 10 Feb 2021 19:12:11 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-392-5fGiYAcDPUW2u_uMcE6DRw-1; Wed, 10 Feb 2021 14:12:08 -0500
X-MC-Unique: 5fGiYAcDPUW2u_uMcE6DRw-1
Received: by mail-ed1-f53.google.com with SMTP id s11so4325781edd.5
	for <linux-audit@redhat.com>; Wed, 10 Feb 2021 11:12:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=2QbvzeG3VmH3KsCk4ue07KCAt90tFpjF95vS6+GwX3I=;
	b=e7QZ9kL2o2EBJKw1dSvsP6udOU6D0ThcmC5hV+2ymDsLkoTiE1H6d+KLfWnA4MaHGQ
	7FJ8XdxfG4IS5zXr0MBMBLqbXSGCjhdqWJnrPzNW3XIPHQl3bQU6s624FAEu79LCLbLQ
	2owAZf5FNvA/3denR941NkO3M3SQH9qK24g0b21kBro4DROhwIlO8eHulAF2ixm2q2V2
	fpyqNITzM7o+hDKwg9193qU52r1wCJCIFqqRVeov7DxBeuiepspBA4Gi45Ficj14atyQ
	Gh6vuzThwIsr8xL1MsuV9zD343Eq2GvzrVZJDqG44rzA6gEgBYfpB48KjhiKh1xvdMF0
	bCKg==
X-Gm-Message-State: AOAM533/lOU14G04DRRnJr8fiKvgOGRLzRIdix/kTqHkv2lRkDOwMQ6Z
	7JBFJ3r6c+Bi1IlO8cqNNspNAgTCMnUD49hdpo0kAn/0FYts5g==
X-Google-Smtp-Source: ABdhPJyJ3kaF2zzyCenV1hmsj0OADoH52JkYpSV5vQ4kbjUL38l9ayQC70KWQSDaa/sPgEzBzWBa0X0EREkzPKarJnY=
X-Received: by 2002:a05:6402:424a:: with SMTP id
	g10mr4575772edb.236.1612984326581; 
	Wed, 10 Feb 2021 11:12:06 -0800 (PST)
MIME-Version: 1.0
References: <12872550.uLZWGnKmhe@x2>
	<CAKo+F=+h2VXhGfeLzOB7WRqFAiDFgo23m1-Kh5k-=AXbzXWnZA@mail.gmail.com>
In-Reply-To: <CAKo+F=+h2VXhGfeLzOB7WRqFAiDFgo23m1-Kh5k-=AXbzXWnZA@mail.gmail.com>
From: LC Bruzenak <lenny@magitekltd.com>
Date: Wed, 10 Feb 2021 13:11:55 -0600
Message-ID: <CAKo+F=LFA_o2jduY81r52F=hipPTvDEr5LgV5A27x8CKz8WyQQ@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============0936452985701537903=="

--===============0936452985701537903==
Content-Type: multipart/alternative; boundary="000000000000d085c505bb002d12"

--000000000000d085c505bb002d12
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 10, 2021 at 1:07 PM LC Bruzenak <lenny@magitekltd.com> wrote:

> On Mon, Feb 8, 2021 at 7:44 PM Steve Grubb <sgrubb@redhat.com> wrote:
>
>> Hello,
>>
>> I have recently checked in to the audit tree 2 experimental plugins. You
>> can
>> enable them by passing --enable-experimental to configure. One of the new
>> plugins is aimed at providing audit metrics to a statsd server. The idea
>> being that you can use this to relay the metrics to influxdb, prometheus
>> or
>> some other collector. Then you can use Grafana to visualize and alert.
>>
>> Currently, it supports the following metrics:
>>
>> kernel.audit.lost
>> kernel.audit.backlog
>> auditd.free_space
>> auditd.plugin_current_depth
>> auditd.plugin_max_depth
>> audit_events.total_count
>> audit_events.total_failed
>> audit_events.avc_count
>> audit_events.fanotify_count
>> audit_events.logins_failed
>> audit_events.logins_success
>> audit_events.anomaly_count
>> audit_events.response_count
>>
>> I'd be interested in hearing if this would be useful. And if these are
>> the
>> right metrics that people are interested in. Should something else be
>> measured? Should an example Grafana dashboard be included?
>>
>> Let me know what you think.
>>
>> -Steve
>>
>>
> Steve,
>
> I think this could be awesome; hoping to give it a try soon. An example
> dashboard would be very helpful if you could include that.
> The stats you already point out a good start.
>
> I'd also like to have a way to parse the per-machine kernel-assigned event
> IDs for missing ones. Might that need a separate plugin for that or could
> something be done within this setup?
> I'm pretty sure there are more metrics that would be desired as well as
> some derived; e.g. take a per-user login/logoff set to identify time spent
> on a particular machine (screenlocks notwithstanding, but maybe
> eventually). Or perhaps if clients send events+heartbeats, when are they
> up/down? These are some of the questions I've heard from security overseers.
>
> And while some of these may not be inspected directly by the end users, in
> the case of trouble calls or questions they might be the exact thing I'd
> ask them to relay to me in order to diagnose a problem or answer a question
> remotely.
>
> Thx,
> LCB
>
>
... and I forgot to ask - can you include a README there which specifies
the minimum kernel/userspace level of code required?

LCB

-- 

LC (Lenny) Bruzenak
lenny@magitekltd.com

--000000000000d085c505bb002d12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Feb 10, 2021 at 1:07 PM LC Bruzen=
ak &lt;<a href=3D"mailto:lenny@magitekltd.com">lenny@magitekltd.com</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Mon, Feb 8, 2021 at=
 7:44 PM Steve Grubb &lt;<a href=3D"mailto:sgrubb@redhat.com" target=3D"_bl=
ank">sgrubb@redhat.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
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
><div><br></div><div>Thx,</div><div>LCB<br></div><br></div></div></blockquo=
te><div><br></div><div>... and I forgot to ask - can you include a README t=
here which specifies the minimum kernel/userspace level of code required?<b=
r></div></div><div><br></div><div>LCB<br></div><br>-- <br><div dir=3D"ltr" =
class=3D"gmail_signature"><div><br></div><div>LC (Lenny) Bruzenak</div><div=
><a href=3D"mailto:lenny@magitekltd.com" target=3D"_blank">lenny@magitekltd=
.com</a></div></div></div>

--000000000000d085c505bb002d12--

--===============0936452985701537903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============0936452985701537903==--

