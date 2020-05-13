Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id F35C11D1C07
	for <lists+linux-audit@lfdr.de>; Wed, 13 May 2020 19:17:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589390251;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=WLP7HgmsEc8OjyAXHf1YT2ShZGOIatu0SYmvX1BhrAI=;
	b=BDh81H/i6Og8tRwpKKDKIMKTrSkJ64ud5trOZQ3b8pE9oSFJpvOGJnGvnDFreD5dAbkh5/
	2mHCz15Frc39QVIVLolinndRKREQdykE4Ld1rq/x0hsml3rYtaxgpbfCJDSPw11TwVauLO
	ViU9dl2qK3+5rE58dLxvzQPgHJ9bnTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-ac7hpfOIMwac-sBf8wS8nw-1; Wed, 13 May 2020 13:17:28 -0400
X-MC-Unique: ac7hpfOIMwac-sBf8wS8nw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A7608014D7;
	Wed, 13 May 2020 17:17:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32FAF60CD3;
	Wed, 13 May 2020 17:17:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 60DC94CAA7;
	Wed, 13 May 2020 17:17:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04DHHBcS012288 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 13:17:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9C8BE114CC6; Wed, 13 May 2020 17:17:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 976AE115E13
	for <linux-audit@redhat.com>; Wed, 13 May 2020 17:17:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BC7E833B44
	for <linux-audit@redhat.com>; Wed, 13 May 2020 17:17:09 +0000 (UTC)
Received: from sonic304-21.consmr.mail.ne1.yahoo.com
	(sonic304-21.consmr.mail.ne1.yahoo.com [66.163.191.147]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-489-wkOzDWlwMW2okFw8_7_cBQ-1;
	Wed, 13 May 2020 13:17:05 -0400
X-MC-Unique: wkOzDWlwMW2okFw8_7_cBQ-1
X-YMail-OSG: taRbnsEVM1lA_RSrI3fL1TQRW9SxBWIcISdxplVY06wlwlyi0wJH36FYZk5VF7g
	k._oMZUySCE1VwW2OdDv8ObMWXGzuXCTMzG5.xTkNAVdM03xvLg899mJm5oh1ynvj_FEz7BoPsGL
	68vTm7tbfpb4BOjWHsIOQYeBft3Amho10slqo9wzqeMIQmaXebQyHvlbwIc8LxdrdPjUWZAAnRj7
	CLmGktokeTIb85nKrCmyhySJ.W2CIn_C2x54YKb9SRtsNXPNERkQgLS.h0yNdJ6s4LY2mLvPdgT4
	d_fpEU4_ASbwln.6xaeErqWEwWtmD9i83PmTGDd3jTxhoi0EIDH37tg0UuVTdymeoLh.S7YZRLc4
	ObRVoNHGV.vOx6lIhZkdHk6_QY7X0DPjeTwi.7z_hCB6i.RLBOk362uWEd9qEvXTL8nSbiBdo2Pc
	stWlPEPzs66NYTrfzR8bd724FUdVtg.N7BdP.nvviYlHAxL2qaTZXjPSFb2wDs94egbNUdj6hgQS
	v8wPgzOoIfGwp9yx9AXhLBhgUd3K.mU5KSPD0r.agvG1aMQD3GqCVuHJ6AT_Op1EQm8laJo3VccU
	B0O0wuD.7jkuxFsJ_QIO5xOSX3Rhqq3VIgFcltbSGNmerz8_z5ZCuev7VzaRIRXPEsCCGv1fEq8V
	Z6n6BpG8QnTD__TbGOk8lQ6MagmfQSN4BrQzRcGhPLTKthXgz7IX_hnLKsiBMk57hFdd6uBsfQrY
	2OliNi4_6AHIPW8ht5itbyAIKCz4hZ.OaiTrnQfRdcgc9AyMxvO5KYBawKKyovhHE6BE0usYvD0Z
	3SP9IiiQ_sVTPu7X7hWGbAuyuCFFXphpY8tnye_rTNptnDl85ZCSwFWX_gwgjVs0AUIBdV8BxEos
	_PT73Ek_BnievQ5xlEonHIXFP.5782dy43g9nGorxs7zlio3xiVBfdPqWVaFovLfxPK2D2ECLP2.
	cmA1S._9yGLFfKu8izjc139bhUT8YkLC7RJkS.zpBqopV3j78HHfZg11Mr_D9p37PQo3hNmggf2K
	sRjKxkteVIL4mHlnbwyLWg261.wvuR8aPs3H1t.6HrZyjYHyBUmwpb.vAujCli3BZL_FTWD.dQVV
	f2wXC0qO2U3IBJObnUZr6VixF6Ty9E73G.Fw4ZiOUnzmv4WM5rvYAkhjEMsWv9EDPQiaIjv1zWj4
	7158DdzpYShqs7SiPBIU5WzSU19yTk62BxmTsQsb8XrWkhcHFzuWVafsmD8TNgCxvMWZDEJ3bWti
	JvlJET3gZGrRTo2RpaXSNzgnEK41Do1utOkSdqRzMviaxHZCjoZhIh2ARsMc.bYYCEpaTtoHRmzd
	OEoif8hDbRwh30djU00hR
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic304.consmr.mail.ne1.yahoo.com with HTTP;
	Wed, 13 May 2020 17:17:04 +0000
Date: Wed, 13 May 2020 17:17:02 +0000 (UTC)
From: Joe Wulf <joe_wulf@yahoo.com>
To: linux-audit@redhat.com
Message-ID: <2037581034.269445.1589390222295@mail.yahoo.com>
In-Reply-To: <6360160.ZmnOHIC0Qm@x2>
References: <6360160.ZmnOHIC0Qm@x2>
Subject: Re: reactive audit proposal
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============0614384867251049031=="

--===============0614384867251049031==
Content-Type: multipart/alternative; 
	boundary="----=_Part_269444_1312472960.1589390222293"

------=_Part_269444_1312472960.1589390222293
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

 Steve,
What you propose is a sound enhancement.
I have no preference for the choice between incorporate this in the audit daemon versus a plugin.What would be the effort to switch from one to the other if later on you should find the first choice wasn't as optimal?

I wonder about the case where a system is booted with new media already attached.
Thank you.
R,-Joe Wulf
PS resent, as the first time I'd only emailed Steve my reply.


    On Tuesday, May 12, 2020, 8:22:48 PM EDT, Steve Grubb <sgrubb@redhat.com> wrote:
 Hello,

I wanted to run this by the crowd to see what people's reaction might be.

The audit system sometimes needs to have rules applied when something
happens. For example, if someone plugs in a USB flash drive, the system
creates the device in /dev and then automatically mounts it under some
circumstances.

I would propose 2 new additions to the audit rule syntax: on-mount and
on-login.These rules would be in a separate file from the main audit rules.
When a file system is mounted, /proc/mounts changes and the mount table can
be scanned to see if something new is there. In this way we can reliably
detect newly mounted filesystems. We can then match against a specifier to
see if this is a file system in which we want to apply new rules. If so, we
send the new rules to the kernel. When the device is unmounted, the kernel
drops all watches on that file system. So, we only need to worry about when
a device is mounted.

This works good for anything that gets mounted. But it is also possible for
a USB flash drive to be accessed as a block device, such as the dd utility.
If we had to detect device discovery, there is a netlink group,
NETLINK_KOBJECT_UEVENT which we could monitor for events. The only thing is
that we could only detect open/read/write/close/ioctl/lseek. And we probably
do not want to monitor anything except block devices.

It may also be possible to poll /sys/block to watch for changes. This might
be easier as the names are more friendly. This would take some research to
see if its even possible.

The rule syntax could look something like:
on=mount mount=/run/user/1000 : -a exit,always ...
on=device device=/dev/sdd : -a exit,always ...

The on-login event would simply watch the audit trail for any AUDIT_LOGIN
events. That event can be parsed to get the new auid. If the auid matches
any rules, then it will load them into the kernel. To remove the rules, we
could watch for the AUDIT_USER_END event. The only issue is that we would
need to track how many sessions the user has open and remove the rules only
when the last session closes out.

The rules for this might look something like this:
on=login auid=1000 : -a exit,always ...

The question is whether or not this should be done as part of the audit
daemon or as a plugin for the audit daemon. One advantage of doing this as
a plugin is that it will keep the audit daemon focused on getting events
and distributing them. Any programming mistake in the plugin will crash it
and not the daemon. The tradeoff is that it will get the event slightly
after auditd sees it. This only matters for the on-login functionality. The
device and mount events come from an entirely different source. And I'm sure 
that in every case, the program will react faster than a user possibily can 
winning the race evry time.

Thoughts?

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

  
------=_Part_269444_1312472960.1589390222293
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp9a647e90yahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px=
;"><div></div>
        <div dir=3D"ltr" data-setdir=3D"false"><div><div dir=3D"ltr" data-s=
etdir=3D"false">Steve,</div><div dir=3D"ltr" data-setdir=3D"false"><br></di=
v><div dir=3D"ltr" data-setdir=3D"false">What you propose is a sound enhanc=
ement.</div><div dir=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"lt=
r" data-setdir=3D"false">I have no preference for the choice between incorp=
orate this in the audit daemon versus a plugin.</div><div dir=3D"ltr" data-=
setdir=3D"false">What would be the effort to switch from one to the other i=
f later on you should find the first choice wasn't as optimal?<br></div><di=
v dir=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=
=3D"false">I wonder about the case where a system is booted with new media =
already attached.</div><div dir=3D"ltr" data-setdir=3D"false"><br></div><di=
v dir=3D"ltr" data-setdir=3D"false">Thank you.</div><div dir=3D"ltr" data-s=
etdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">R,</div><d=
iv>-Joe Wulf</div><div><br></div><div dir=3D"ltr" data-setdir=3D"false">PS =
resent, as the first time I'd only emailed Steve my reply.<br></div></div><=
div><br></div></div><div><br></div>
       =20
        </div><div id=3D"ydp5335c35cyahoo_quoted_0199602483" class=3D"ydp53=
35c35cyahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Tuesday, May 12, 2020, 8:22:48 PM EDT, Steve Grubb &=
lt;sgrubb@redhat.com&gt; wrote:</div><div><br></div>
                <div><div dir=3D"ltr">Hello,<br></div><div dir=3D"ltr"><br>=
</div><div dir=3D"ltr">I wanted to run this by the crowd to see what people=
's reaction might be.<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">=
The audit system sometimes needs to have rules applied when something<br></=
div><div dir=3D"ltr">happens. For example, if someone plugs in a USB flash =
drive, the system<br></div><div dir=3D"ltr">creates the device in /dev and =
then automatically mounts it under some<br></div><div dir=3D"ltr">circumsta=
nces.<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">I would propose =
2 new additions to the audit rule syntax: on-mount and<br></div><div dir=3D=
"ltr">on-login.These rules would be in a separate file from the main audit =
rules.<br></div><div dir=3D"ltr">When a file system is mounted, /proc/mount=
s changes and the mount table can<br></div><div dir=3D"ltr">be scanned to s=
ee if something new is there. In this way we can reliably<br></div><div dir=
=3D"ltr">detect newly mounted filesystems. We can then match against a spec=
ifier to<br></div><div dir=3D"ltr">see if this is a file system in which we=
 want to apply new rules. If so, we<br></div><div dir=3D"ltr">send the new =
rules to the kernel. When the device is unmounted, the kernel<br></div><div=
 dir=3D"ltr">drops all watches on that file system. So, we only need to wor=
ry about when<br></div><div dir=3D"ltr">a device is mounted.<br></div><div =
dir=3D"ltr"><br></div><div dir=3D"ltr">This works good for anything that ge=
ts mounted. But it is also possible for<br></div><div dir=3D"ltr">a USB fla=
sh drive to be accessed as a block device, such as the dd utility.<br></div=
><div dir=3D"ltr">If we had to detect device discovery, there is a netlink =
group,<br></div><div dir=3D"ltr">NETLINK_KOBJECT_UEVENT which we could moni=
tor for events. The only thing is<br></div><div dir=3D"ltr">that we could o=
nly detect open/read/write/close/ioctl/lseek. And we probably<br></div><div=
 dir=3D"ltr">do not want to monitor anything except block devices.<br></div=
><div dir=3D"ltr"><br></div><div dir=3D"ltr">It may also be possible to pol=
l /sys/block to watch for changes. This might<br></div><div dir=3D"ltr">be =
easier as the names are more friendly. This would take some research to<br>=
</div><div dir=3D"ltr">see if its even possible.<br></div><div dir=3D"ltr">=
<br></div><div dir=3D"ltr">The rule syntax could look something like:<br></=
div><div dir=3D"ltr">on=3Dmount mount=3D/run/user/1000 : -a exit,always ...=
<br></div><div dir=3D"ltr">on=3Ddevice device=3D/dev/sdd : -a exit,always .=
..<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">The on-login event =
would simply watch the audit trail for any AUDIT_LOGIN<br></div><div dir=3D=
"ltr">events. That event can be parsed to get the new auid. If the auid mat=
ches<br></div><div dir=3D"ltr">any rules, then it will load them into the k=
ernel. To remove the rules, we<br></div><div dir=3D"ltr">could watch for th=
e AUDIT_USER_END event. The only issue is that we would<br></div><div dir=
=3D"ltr">need to track how many sessions the user has open and remove the r=
ules only<br></div><div dir=3D"ltr">when the last session closes out.<br></=
div><div dir=3D"ltr"><br></div><div dir=3D"ltr">The rules for this might lo=
ok something like this:<br></div><div dir=3D"ltr">on=3Dlogin auid=3D1000 : =
-a exit,always ...<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">The=
 question is whether or not this should be done as part of the audit<br></d=
iv><div dir=3D"ltr">daemon or as a plugin for the audit daemon. One advanta=
ge of doing this as<br></div><div dir=3D"ltr">a plugin is that it will keep=
 the audit daemon focused on getting events<br></div><div dir=3D"ltr">and d=
istributing them. Any programming mistake in the plugin will crash it<br></=
div><div dir=3D"ltr">and not the daemon. The tradeoff is that it will get t=
he event slightly<br></div><div dir=3D"ltr">after auditd sees it. This only=
 matters for the on-login functionality. The<br></div><div dir=3D"ltr">devi=
ce and mount events come from an entirely different source. And I'm sure <b=
r></div><div dir=3D"ltr">that in every case, the program will react faster =
than a user possibily can <br></div><div dir=3D"ltr">winning the race evry =
time.<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Thoughts?<br></d=
iv><div dir=3D"ltr"><br></div><div dir=3D"ltr">-Steve<br></div><div dir=3D"=
ltr"><br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">--<br></div><div=
 dir=3D"ltr">Linux-audit mailing list<br></div><div dir=3D"ltr"><a href=3D"=
mailto:Linux-audit@redhat.com" rel=3D"nofollow" target=3D"_blank">Linux-aud=
it@redhat.com</a><br></div><div dir=3D"ltr"><a href=3D"https://www.redhat.c=
om/mailman/listinfo/linux-audit" rel=3D"nofollow" target=3D"_blank">https:/=
/www.redhat.com/mailman/listinfo/linux-audit</a><br></div><div dir=3D"ltr">=
<br></div></div>
            </div>
        </div></body></html>
------=_Part_269444_1312472960.1589390222293--

--===============0614384867251049031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============0614384867251049031==--

