Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5142D1C50
	for <lists+linux-audit@lfdr.de>; Mon,  7 Dec 2020 22:49:15 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-nEUS18yIPAKca28OuxfOEQ-1; Mon, 07 Dec 2020 16:49:12 -0500
X-MC-Unique: nEUS18yIPAKca28OuxfOEQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 963E357001;
	Mon,  7 Dec 2020 21:49:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B3115C1A1;
	Mon,  7 Dec 2020 21:49:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4AD944A7C6;
	Mon,  7 Dec 2020 21:49:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B7Lmrm3028116 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 7 Dec 2020 16:48:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9EEB986D66; Mon,  7 Dec 2020 21:48:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 988208576F
	for <linux-audit@redhat.com>; Mon,  7 Dec 2020 21:48:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2942B858EEC
	for <linux-audit@redhat.com>; Mon,  7 Dec 2020 21:48:50 +0000 (UTC)
Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com
	[209.85.161.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-253-g2GiZO4WMLGKMIGQmj9nvA-1; Mon, 07 Dec 2020 16:48:47 -0500
X-MC-Unique: g2GiZO4WMLGKMIGQmj9nvA-1
Received: by mail-oo1-f65.google.com with SMTP id w9so3547355ooh.13;
	Mon, 07 Dec 2020 13:48:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Aw6Q5c3yCbe9eyO8069p1palfDaLuXaGIlMw+T2RhHU=;
	b=GF7RT/TC2+nMGn+S1Xgt26jn81CtR+M19zHSK0B+Ibn9kzrwFneOXT66Q4h7b8ClDb
	roEpuB1Bj1RxdtZXIWhIAgB5IkuCEHrIe7pdMPu6FN31tsqT4kBKR+yFsfUJmIztRXMP
	KF4K0q+2ovDreARlUifXBmgs2gzhZ5CgTBsaQzlPWWTT+91+7f1DV9S40UO4q9RZ59+t
	7OAtMvOnron2Gx55bOEGJ93HOCMC74F04QYMtyLg2QWsMCzLxUULX2WRSGyFeirvtkaL
	SgZZHu5oWqvSvURY7TnKoBs1WR/2yAhZawY/bXXZW2AVZBGXhxmdRzvKbEGkwPhsXLuh
	WVpQ==
X-Gm-Message-State: AOAM532/AijFH1nhotA1ZxYRBTxqNTTcwgpQpsLJX5DmD8ImKcjilk60
	o8Ul0xMdhwUOGC0W3azAzciGUJTXfJwDiXDNkQ07Rcw/Qw4=
X-Google-Smtp-Source: ABdhPJxhDjme7IGEHOc5kNh822JzrTfMquj2Gh3fa9uuXKm8eya4WbPPWwb4a69Cdqn11bKQAOJdKtvZXRArgQL1ATA=
X-Received: by 2002:a4a:5590:: with SMTP id e138mr8284975oob.13.1607377726329; 
	Mon, 07 Dec 2020 13:48:46 -0800 (PST)
MIME-Version: 1.0
References: <20200701213244.GA1817@linux-kernel-dev>
	<848576065.3879079.1606970019196@mail.yahoo.com>
In-Reply-To: <848576065.3879079.1606970019196@mail.yahoo.com>
From: Max Englander <max.englander@gmail.com>
Date: Mon, 7 Dec 2020 16:48:35 -0500
Message-ID: <CAK50otVY9miWW02HWpCHZfnxSju9_ZmysqN3WRrfw=56-MRs8g@mail.gmail.com>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
To: Joe Wulf <joe_wulf@yahoo.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6298260018881921166=="

--===============6298260018881921166==
Content-Type: multipart/alternative; boundary="00000000000065d72505b5e6caa7"

--00000000000065d72505b5e6caa7
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 2, 2020 at 11:33 PM Joe Wulf <joe_wulf@yahoo.com> wrote:

> I would like to suggest providing a mechanism where admins can query the
> status or state of backlog issues (wait time, sums, etc...).  Maybe the
> intent is to expand the output of status checking of auditd.
>
> I believe further clarity is beneficial on the setting of the
> 'backlog_wait_sum' (or to whatever the name evolves to) initially.
> -  How it evolves over time
> -  What the conditions in the system, or auditing, would change it
> -  What conditions admins should pay attention to for informational
> understanding of status
> -  What conditions admins should realize exist such that adjustments are
> needed
>    (and suggestions to what those adjustments should be)
> -  What new guidance will admins have for building adjusting audit.rules
> around this
>
> Consider the scenario where auditing has been 'working fine' for days.
> Little to no active admin monitoring.
> Events occur to spike the auditing such that backloging of audit records
> dramatically increases.
> (for some reason) admins now come looking to investigate.
> Assuming they do:  'systemctl status auditd' the newly presented 'state'
> of the 'backlog_wait_sum' will show some evidence.
> Q:  Is that just a moment in time?
> Q:  What information here will give the perspective things are good/ok
> 'now', versus some action needs to be taken?
>
> Maybe that isn't a great scenario, or good questions----it is what occurs
> to me at the moment.
>
> Thank you.
>
> R,
> -Joe Wulf
>
>
> On Wednesday, July 1, 2020, 5:33:14 PM EDT, Max Englander <
> max.englander@gmail.com> wrote:
>
> >  In environments where the preservation of audit events and predictable
> >  usage of system memory are prioritized, admins may use a combination of
> >  --backlog_wait_time and -b options at the risk of degraded performance
> >  resulting from backlog waiting. In some cases, this risk may be
> >  preferred to lost events or unbounded memory usage. Ideally, this risk
> >  can be mitigated by making adjustments when backlog waiting is
> detected.
> >
> >  However, detection can be diffult using the currently available
> metrics.
> >  For example, an admin attempting to debug degraded performance may
> >  falsely believe a full backlog indicates backlog waiting. It may turn
> >  out the backlog frequently fills up but drains quickly.
> >
> >  To make it easier to reliably track degraded performance to backlog
> >  waiting, this patch makes the following changes:
> >
> >  Add a new field backlog_wait_sum to the audit status reply. Initialize
> >  this field to zero. Add to this field the total time spent by the
> >  current task on scheduled timeouts while the backlog limit is exceeded.
> >
> >  Tested on Ubuntu 18.04 using complementary changes to the audit
> >  userspace: https://github.com/linux-audit/audit-userspace/pull/134.
>
> <snip>
>

Hi Joe,

Not sure I can address all your points above, but the way that we monitor
Linux audit internals at my employer is to continuously monitor the audit
status
response with short evaluation windows.

- We compute a rate of change on the lost field, and alert if the there are
more than N lost records per second on average
- We compute the backlog utilization by computing backlog/backlog_limit,
and alert if that goes above 75% at any point in time
- If/when we run on a kernel that has backlog_wait_time_actual, we'll
monitor on that as well, setting thresholds around where we'd expect
growth in this value to result in service degradation.

If we get an alert, and it is just a blip that goes away and doesn't come
back,
we probably won't spend a lot of time investigating. However, if we see
that the alert is frequently active across multiple hosts, that will prompt
us
to investigate. As far as what action we would take, it would depend on
the precise values in the audit status reply, as well as other information
we
had gathered from our system. For example, if we observed elevated values
for backlog and backlog_wait_time_actual, we might first investigate other
environmental factors such as whether the auditd daemon was crashed or
starved for CPU time. If we saw that lost was high but backlog was low
that might indicate to us that the rate limit is being exceeded, or that the
kernel is out of memory.

I agree with you that it would help to expand the metrics reported in
audit status. For example, reporting the number of times an audit record was
lost due to rate limit being exceeded would help.

Not sure how responsive this is to your questions. Hope it helps some.

Thanks,
Max

--00000000000065d72505b5e6caa7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Dec 2, 2020 at 11:33 PM Joe Wulf =
&lt;<a href=3D"mailto:joe_wulf@yahoo.com">joe_wulf@yahoo.com</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div><div style=3D"font-family:&quot;Helvetica Neue&quot;,Helve=
tica,Arial,sans-serif;font-size:16px" dir=3D"ltr"><div></div><div>I would l=
ike to suggest providing a mechanism where admins can query the status or s=
tate of backlog issues (wait time, sums, etc...).=C2=A0 Maybe the intent is=
 to expand the output of status checking of auditd.<br></div><div><br></div=
><div dir=3D"ltr">I believe further clarity is beneficial on the setting of=
 the &#39;backlog_wait_sum&#39; (or to whatever the name evolves to) initia=
lly.</div><div dir=3D"ltr">-=C2=A0 How it evolves over time</div><div dir=
=3D"ltr">-=C2=A0 What the conditions in the system, or auditing, would chan=
ge it</div><div dir=3D"ltr">-=C2=A0 What conditions admins should pay atten=
tion to for informational understanding of status<br></div><div dir=3D"ltr"=
>-=C2=A0 What conditions admins should realize exist such that adjustments =
are needed</div><div dir=3D"ltr">=C2=A0=C2=A0 (and suggestions to what thos=
e adjustments should be)</div><div dir=3D"ltr">-=C2=A0 What new guidance wi=
ll admins have for building adjusting audit.rules around this<br></div><div=
 dir=3D"ltr"><br></div><div dir=3D"ltr">Consider the scenario where auditin=
g has been &#39;working fine&#39; for days.</div><div dir=3D"ltr">Little to=
 no active admin monitoring.</div><div dir=3D"ltr">Events occur to spike th=
e auditing such that backloging of audit records dramatically increases.</d=
iv><div dir=3D"ltr">(for some reason) admins now come looking to investigat=
e.</div><div dir=3D"ltr">Assuming they do:=C2=A0 &#39;systemctl status audi=
td&#39; the newly presented &#39;state&#39; of the &#39;backlog_wait_sum&#3=
9; will show some evidence.</div><div dir=3D"ltr">Q:=C2=A0 Is that just a m=
oment in time?</div><div dir=3D"ltr">Q:=C2=A0 What information here will gi=
ve the perspective things are good/ok &#39;now&#39;, versus some action nee=
ds to be taken?</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Maybe that=
 isn&#39;t a great scenario, or good questions----it is what occurs to me a=
t the moment.<br></div><br><div dir=3D"ltr">Thank you.</div><div dir=3D"ltr=
"><br></div><div dir=3D"ltr">R,</div><div dir=3D"ltr">-Joe Wulf</div><div d=
ir=3D"ltr"><br></div><div><br></div>
       =20
        </div><div id=3D"gmail-m_7201954468447359401ydp8386d029yahoo_quoted=
_7689069360">
            <div style=3D"font-family:&quot;Helvetica Neue&quot;,Helvetica,=
Arial,sans-serif;font-size:13px;color:rgb(38,40,42)">
               =20
                <div>
                    On Wednesday, July 1, 2020, 5:33:14 PM EDT, Max England=
er &lt;<a href=3D"mailto:max.englander@gmail.com" target=3D"_blank">max.eng=
lander@gmail.com</a>&gt; wrote:
                </div>
               =20
                <div><br></div>
                <div dir=3D"ltr">&gt;=C2=A0 In environments where the prese=
rvation of audit events and predictable<br><div><span>&gt;=C2=A0 </span>usa=
ge of system memory are prioritized, admins may use a combination of</div><=
div><span>&gt;=C2=A0 </span>--backlog_wait_time and -b options at the risk =
of degraded performance</div><div><span>&gt;=C2=A0 </span>resulting from ba=
cklog waiting. In some cases, this risk may be</div><div><span>&gt;=C2=A0 <=
/span>preferred to lost events or unbounded memory usage. Ideally, this ris=
k</div><div><span>&gt;=C2=A0 </span>can be mitigated by making adjustments =
when backlog waiting is detected.</div><div><span>&gt;=C2=A0 </span></div><=
div><span>&gt;=C2=A0 </span>However, detection can be diffult using the cur=
rently available metrics.</div><div><span>&gt;=C2=A0 </span>For example, an=
 admin attempting to debug degraded performance may</div><div><span>&gt;=C2=
=A0 </span>falsely believe a full backlog indicates backlog waiting. It may=
 turn</div><div><span>&gt;=C2=A0 </span>out the backlog frequently fills up=
 but drains quickly.</div><div><span>&gt;=C2=A0 </span></div><div><span>&gt=
;=C2=A0 </span>To make it easier to reliably track degraded performance to =
backlog</div><div><span>&gt;=C2=A0 </span>waiting, this patch makes the fol=
lowing changes:</div><div><span>&gt;=C2=A0 </span></div><div><span>&gt;=C2=
=A0 </span>Add a new field backlog_wait_sum to the audit status reply. Init=
ialize</div><div><span>&gt;=C2=A0 </span>this field to zero. Add to this fi=
eld the total time spent by the</div><div><span>&gt;=C2=A0 </span>current t=
ask on scheduled timeouts while the backlog limit is exceeded.</div><div><s=
pan>&gt;=C2=A0 </span></div><div><span>&gt;=C2=A0 </span>Tested on Ubuntu 1=
8.04 using complementary changes to the audit</div><div><span>&gt;=C2=A0 </=
span>userspace: <a href=3D"https://github.com/linux-audit/audit-userspace/p=
ull/134" target=3D"_blank">https://github.com/linux-audit/audit-userspace/p=
ull/134</a>.</div><br>&lt;snip&gt;<br></div></div></div></div></blockquote>=
<div><br></div><div>Hi Joe,</div><div><br></div><div>Not sure I can address=
 all your points above, but the way that we monitor</div><div>Linux audit i=
nternals at my employer is to continuously monitor the audit status</div><d=
iv>response with short evaluation windows.</div><div><br></div><div>- We co=
mpute a rate of change on the lost field, and alert if the there are</div><=
div>more than N lost records per second on average</div><div>- We compute t=
he backlog utilization by computing backlog/backlog_limit,</div><div>and al=
ert if that goes above 75% at any point in time</div><div>- If/when we run =
on a kernel that has backlog_wait_time_actual, we&#39;ll=C2=A0</div><div>mo=
nitor on that as well, setting thresholds around where we&#39;d expect</div=
><div>growth in this value to result in service degradation.</div><div><br>=
</div><div>If we get an alert, and it is just a blip that goes away and doe=
sn&#39;t come back,</div><div>we probably won&#39;t spend a lot of time inv=
estigating. However, if we see</div><div>that the alert is frequently activ=
e across multiple hosts, that will prompt us</div><div>to investigate. As f=
ar as what action we would take, it would depend on</div><div>the precise v=
alues in the audit status reply, as well as other information we</div><div>=
had gathered from our system. For example, if we observed elevated values</=
div><div>for backlog and backlog_wait_time_actual, we might first investiga=
te other</div><div>environmental factors such as whether the auditd daemon =
was crashed or</div><div>starved for CPU time. If we saw that lost was high=
 but backlog was low</div><div>that might indicate to us that the rate limi=
t is being exceeded, or that the</div><div>kernel is out of memory.</div><d=
iv><br></div><div>I agree with you that it would help to expand the metrics=
 reported in</div><div>audit status. For example, reporting the number of t=
imes an audit record was</div><div>lost due to rate limit being exceeded wo=
uld help.</div><div><br></div><div>Not sure how responsive this is to your =
questions. Hope it helps some.</div><div><br></div><div>Thanks,</div><div>M=
ax</div><div><br></div><div><br></div></div></div>

--00000000000065d72505b5e6caa7--

--===============6298260018881921166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============6298260018881921166==--

