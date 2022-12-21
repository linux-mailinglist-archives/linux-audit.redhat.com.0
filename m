Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C31D465381B
	for <lists+linux-audit@lfdr.de>; Wed, 21 Dec 2022 22:12:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671657131;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=0IUpmcssnD4vqTTwGXB9zySgLbiigpOO0MDZNUxjCSE=;
	b=R6vjqBmH1cVpzyuxJ5fsSRxWA1QuGoBcW7DW+ZspJWqOgfKJ6NzvxbeAfOMDoAAVfniCW7
	TSfOP3tkhuTbtXIZn5wHTutHNwn/8Ot5LhI9PRKwIkipmEoqpk8C2bh3iMFBEUkVLn1FLK
	OUDt0FzJ8zh1vNVgTeQMFttYHit/dLI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-J4z_ePtPMQiUL1NEkRfh1w-1; Wed, 21 Dec 2022 16:12:06 -0500
X-MC-Unique: J4z_ePtPMQiUL1NEkRfh1w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBE7D18811FB;
	Wed, 21 Dec 2022 21:12:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 01A842166B26;
	Wed, 21 Dec 2022 21:11:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 04B6819465B6;
	Wed, 21 Dec 2022 21:11:56 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4063419465A4 for <linux-audit@listman.corp.redhat.com>;
 Wed, 21 Dec 2022 21:11:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0A7A1140E90F; Wed, 21 Dec 2022 21:11:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 025B81400AFC
 for <linux-audit@redhat.com>; Wed, 21 Dec 2022 21:11:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D64FE885620
 for <linux-audit@redhat.com>; Wed, 21 Dec 2022 21:11:54 +0000 (UTC)
Received: from mail.swtf.dyndns.org (219-90-185-117.ip.adam.com.au
 [219.90.185.117]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-efOCyk98PIGOoT3BYNCocQ-1; Wed, 21 Dec 2022 16:11:52 -0500
X-MC-Unique: efOCyk98PIGOoT3BYNCocQ-1
Received: from mail.swtf.dyndns.org (localhost [127.0.0.1])
 by mail.swtf.dyndns.org (Postfix) with ESMTP id 0D41E202C03E
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 08:02:57 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at mail.swtf.dyndns.org
Received: from mail.swtf.dyndns.org ([127.0.0.1])
 by mail.swtf.dyndns.org (mail.swtf.dyndns.org [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id EcFsOsXe6CuM for <linux-audit@redhat.com>;
 Thu, 22 Dec 2022 08:02:50 +1100 (AEDT)
Received: from swtf.swtf.dyndns.org (swtf.swtf.dyndns.org [192.168.2.220])
 by mail.swtf.dyndns.org (Postfix) with ESMTPSA id 30E2A202C03B;
 Thu, 22 Dec 2022 08:02:50 +1100 (AEDT)
Message-ID: <36184353421ebef0ee90653ecc71e1a80d9a0040.camel@swtf.dyndns.org>
Subject: Re: BPF audit logs
From: Burn Alting <burn@swtf.dyndns.org>
To: Paul Moore <paul@paul-moore.com>
Date: Thu, 22 Dec 2022 08:02:49 +1100
In-Reply-To: <CAHC9VhTTnhT5pwpa4jjbE+2fTc1aO5oAiVoP9ERm-khC+EkLMQ@mail.gmail.com>
References: <df1eacecc605f856fa80d66d81eddea4dc70ce56.camel@iinet.net.au>
 <5652312.DvuYhMxLoT@x2>
 <602700a68fa5b8d68baef4368eaa5e8adf3799a3.camel@iinet.net.au>
 <CAHC9VhSNq5xzpB2jzxK5oFQAM2uGefihCYH0iq91=0Lm=D8jig@mail.gmail.com>
 <CAHC9VhTTnhT5pwpa4jjbE+2fTc1aO5oAiVoP9ERm-khC+EkLMQ@mail.gmail.com>
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
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
Reply-To: burn@swtf.dyndns.org
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============0590199070497631891=="

--===============0590199070497631891==
Content-Type: multipart/alternative; boundary="=-LKNc0Armd5NGqHFsaT/z"

--=-LKNc0Armd5NGqHFsaT/z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2022-12-21 at 09:54 -0500, Paul Moore wrote:
> On Wed, Dec 21, 2022 at 9:44 AM Paul Moore <paul@paul-moore.com> wrote:
> > On Tue, Dec 20, 2022 at 7:02 PM Burn Alting <burn.alting@iinet.net.au> wrote:
> > > And to cap this off, the program id will always be zero on an UNLOAD, asthe
> > > routine that sets it to zero, kernel/bpf/syscall.c:bpf_prog_free_id(),is
> > > called before the emit audit event routine,
> > > kernel/bpf/syscall.c:bpf_audit_prog().
> > > So a bug!
> > 
> > Ooof :/  Independent of the other issues this is something we shouldfix as soon
> > as we can.  I'll take a look during the holiday and seewhat we can do to fix
> > this; looking quickly at it now I don't think itwill be too bad, but one never
> > knows for sure ...
> 
> I'm still just looking at the code, but I think we can also do abetter job
> associating eBPF UNLOAD operations
As Steve suggests, it would have value to provide more information (name, tag, uid)
and I don't know if it's possible
but relate it to the bpf syscall's file descriptor for the map created or program
loaded (the exit value).

--=-LKNc0Armd5NGqHFsaT/z
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Wed, 2022-12-21 at 09:54 -0500, Paul Moore wrote:</div><blockqu=
ote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid=
;padding-left:1ex"><pre>On Wed, Dec 21, 2022 at 9:44 AM Paul Moore &lt;</pr=
e><a href=3D"mailto:paul@paul-moore.com"><pre>paul@paul-moore.com</pre></a>=
<pre>&gt; wrote:</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex;=
 border-left:2px #729fcf solid;padding-left:1ex"><pre>On Tue, Dec 20, 2022 =
at 7:02 PM Burn Alting &lt;</pre><a href=3D"mailto:burn.alting@iinet.net.au=
"><pre>burn.alting@iinet.net.au</pre></a><pre>&gt; wrote:</pre><blockquote =
type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;pad=
ding-left:1ex"><pre>And to cap this off, the program id will always be zero=
 on an UNLOAD, as</pre><pre>the routine that sets it to zero, kernel/bpf/sy=
scall.c:bpf_prog_free_id(),</pre><pre>is called before the emit audit event=
 routine, kernel/bpf/syscall.c:bpf_audit_prog().</pre><pre><br></pre><pre>S=
o a bug!</pre></blockquote><pre><br></pre><pre>Ooof :/  Independent of the =
other issues this is something we should</pre><pre>fix as soon as we can.  =
I'll take a look during the holiday and see</pre><pre>what we can do to fix=
 this; looking quickly at it now I don't think it</pre><pre>will be too bad=
, but one never knows for sure ...</pre></blockquote><pre><br></pre><pre>I'=
m still just looking at the code, but I think we can also do a</pre><pre>be=
tter job associating eBPF UNLOAD operations</pre></blockquote><div>As Steve=
 suggests, it would have value to provide more information (name, tag, uid)=
 and I don't know if it's possible</div><div>but relate it to the bpf sysca=
ll's file descriptor for the map created or program loaded (the exit value)=
.</div><div><br></div></body></html>

--=-LKNc0Armd5NGqHFsaT/z--

--===============0590199070497631891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============0590199070497631891==--

