Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 88BA3144ED9
	for <lists+linux-audit@lfdr.de>; Wed, 22 Jan 2020 10:34:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579685642;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=PEGVpVQCcCNSU/eZZ9lOaDEFhXaj+4FmOPOvtblaWuM=;
	b=FtMzbFfNSNklCVthfwwcorL9DsMu8SkcOX83kbBWzSmL9+YG6nFG1DfrpcrZj2hlhkSdwU
	UvFWyjgslvzoueGkZDDHxu+Wv8e5MAt5Jz5f07Ne3qcVrn+jVfuy5Qp0JExavfDb2s2Tnx
	LD45C7m89Pc8XtbZ8U8yKlLzGIFSEbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-WOJOJkKHMYq8N2m4pP81nw-1; Wed, 22 Jan 2020 04:34:00 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CCE51005502;
	Wed, 22 Jan 2020 09:33:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1A7B100164D;
	Wed, 22 Jan 2020 09:33:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8314981971;
	Wed, 22 Jan 2020 09:33:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00M9XSgS029574 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Jan 2020 04:33:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 70B51EC4CE; Wed, 22 Jan 2020 09:33:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C68FEC4CB
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 09:33:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E869A801E83
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 09:33:25 +0000 (UTC)
Received: from mail.swtf.dyndns.org
	(ppp121-45-219-219.bras1.cbr2.internode.on.net [121.45.219.219]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-51-diD7V45lN46YM7e-PaUIbw-1; Wed, 22 Jan 2020 04:33:22 -0500
Received: from mail.swtf.dyndns.org (localhost [127.0.0.1])
	by mail.swtf.dyndns.org (Postfix) with ESMTP id 103A4203000A
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 20:33:19 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at mail.swtf.dyndns.org
Received: from mail.swtf.dyndns.org ([127.0.0.1])
	by mail.swtf.dyndns.org (mail.swtf.dyndns.org [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id AuR9-C-9nvLA for <linux-audit@redhat.com>;
	Wed, 22 Jan 2020 20:27:53 +1100 (AEDT)
Received: from swtf.swtf.dyndns.org (swtf.swtf.dyndns.org [192.168.2.220])
	by mail.swtf.dyndns.org (Postfix) with ESMTPSA id 0D35F2030009;
	Wed, 22 Jan 2020 20:27:52 +1100 (AEDT)
Message-ID: <c4078163465539257084371f1b4eed0d105564bb.camel@swtf.dyndns.org>
Subject: Re: auditing removable media
From: Burn Alting <burn@swtf.dyndns.org>
To: Richard Guy Briggs <rgb@redhat.com>, Linux-Audit Mailing List
	<linux-audit@redhat.com>
Date: Wed, 22 Jan 2020 20:27:52 +1100
In-Reply-To: <20200121201654.wezzozvsgbf57oz5@madcap2.tricolour.ca>
References: <20200121201654.wezzozvsgbf57oz5@madcap2.tricolour.ca>
Mime-Version: 1.0
X-MC-Unique: diD7V45lN46YM7e-PaUIbw-1
X-MC-Unique: WOJOJkKHMYq8N2m4pP81nw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: burn@swtf.dyndns.org
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============3577890404292752142=="

--===============3577890404292752142==
Content-Type: multipart/alternative; boundary="=-s1sgbqijLq6QQu21gbe1"

--=-s1sgbqijLq6QQu21gbe1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Richard,
On the surface, it appears to have value, but as you say it would need to b=
e
extended to other traditional, and non-traditional, removable media. Furthe=
r, the
initial appeal in having the capability directly within the kernel was to m=
ake it a
little more difficult to subvert, centralise auditing policy/monitoring and=
, if
frame-worked appropriately, easily extensible to other than USB media types=
 (which
was the basis for the Proof of Concept developed by RedHat back in 2016).
I have not used USBGuard myself, so will do some experimentation and report=
 back.
Regards
On Tue, 2020-01-21 at 15:16 -0500, Richard Guy Briggs wrote:
> Hi Burn, and all,
> I've been aware of this issue for a while now, but wasn't directlyworking=
 on
> it.  Now that I'm taking a closer look at this issue, I amwondering how m=
uch
> USBGuard changes the equation?
> https://www.kernel.org/doc/Documentation/usb/authorization.txt
> https://usbguard.github.io/
> =09https://github.com/USBGuard/usbguard
>=20
> https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/=
html/security_guide/sec-using-usbguard
>=20
> It has tools to generate baseline lists of devices, but this is only
> forusb.  Other interfaces would need to be appropriately instrumented.
> - RGB
> --Richard Guy Briggs <rgb@redhat.com>Sr. S/W Engineer, Kernel Security, B=
ase
> Operating SystemsRemote, Ottawa, Red Hat CanadaIRC: rgb, SunRaycerVoice:
> +1.647.777.2635, Internal: (81) 32635

--=-s1sgbqijLq6QQu21gbe1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>Richard,</div><div><br></div><div>On the surface, it appears to ha=
ve value, but as you say it would need to be extended to other traditional,=
 and non-traditional, removable media. Further, the initial appeal in havin=
g the capability directly within the kernel was to make it a little more di=
fficult to subvert, centralise auditing policy/monitoring and, if frame-wor=
ked appropriately, easily extensible to other than USB media types (which w=
as the basis for the Proof of Concept developed by RedHat back in 2016).</d=
iv><div><br></div><div>I have not used USBGuard myself, so will do some exp=
erimentation and report back.</div><div><br></div><div>Regards</div><div><b=
r></div><div>On Tue, 2020-01-21 at 15:16 -0500, Richard Guy Briggs wrote:</=
div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #=
729fcf solid;padding-left:1ex"><pre>Hi Burn, and all,</pre><pre><br></pre><=
pre>I've been aware of this issue for a while now, but wasn't directly</pre=
><pre>working on it.  Now that I'm taking a closer look at this issue, I am=
</pre><pre>wondering how much USBGuard changes the equation?</pre><pre><br>=
</pre><a href=3D"https://www.kernel.org/doc/Documentation/usb/authorization=
.txt"><pre>https://www.kernel.org/doc/Documentation/usb/authorization.txt</=
pre></a><pre><br></pre><a href=3D"https://usbguard.github.io/"><pre>https:/=
/usbguard.github.io/</pre></a><pre><br></pre><pre>=09</pre><a href=3D"https=
://github.com/USBGuard/usbguard"><pre>https://github.com/USBGuard/usbguard<=
/pre></a><pre><br></pre><pre><br></pre><a href=3D"https://access.redhat.com=
/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-usi=
ng-usbguard"><pre>https://access.redhat.com/documentation/en-us/red_hat_ent=
erprise_linux/7/html/security_guide/sec-using-usbguard</pre></a><pre><br></=
pre><pre><br></pre><pre>It has tools to generate baseline lists of devices,=
 but this is only for</pre><pre>usb.  Other interfaces would need to be app=
ropriately instrumented.</pre><pre><br></pre><pre>- RGB</pre><pre><br></pre=
><pre>--</pre><pre>Richard Guy Briggs &lt;</pre><a href=3D"mailto:rgb@redha=
t.com"><pre>rgb@redhat.com</pre></a><pre>&gt;</pre><pre>Sr. S/W Engineer, K=
ernel Security, Base Operating Systems</pre><pre>Remote, Ottawa, Red Hat Ca=
nada</pre><pre>IRC: rgb, SunRaycer</pre><pre>Voice: +1.647.777.2635, Intern=
al: (81) 32635</pre><pre><br></pre></blockquote></body></html>

--=-s1sgbqijLq6QQu21gbe1--

--===============3577890404292752142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============3577890404292752142==--

