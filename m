Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8F56A1D6DAE
	for <lists+linux-audit@lfdr.de>; Sun, 17 May 2020 23:56:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589752587;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mREOn3aZ95Wy3aQaNyORjECbsZ40ReWtEetyN86IU9w=;
	b=YYhnnI9xNov7jRPWjZXRfMdAjmTp9DENCUgGvBh4wgdL11C0SvZ+PQ3vT/JOD4Pnj2WkEy
	mjet3K1tKK7K8/GQBCXUL87YjvG9l8e8Ix6mxyX8qpbyrZyt+7wUvCr308G+BFB5Li4FHF
	C4IzTX56ts3fKQGdDIP3K+ygY3SRpj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-WawTnio8OzyMuIX15EU38A-1; Sun, 17 May 2020 17:56:24 -0400
X-MC-Unique: WawTnio8OzyMuIX15EU38A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3DE11005510;
	Sun, 17 May 2020 21:56:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFD3A1001920;
	Sun, 17 May 2020 21:56:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD81E1809543;
	Sun, 17 May 2020 21:56:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04HLuC3C021211 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 17 May 2020 17:56:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5A711110F38A; Sun, 17 May 2020 21:56:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55B4C110F380
	for <linux-audit@redhat.com>; Sun, 17 May 2020 21:56:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94588101A525
	for <linux-audit@redhat.com>; Sun, 17 May 2020 21:56:09 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-376-o3ZfpPiCOV-Sb2ozUEsEFA-1; Sun, 17 May 2020 17:56:07 -0400
X-MC-Unique: o3ZfpPiCOV-Sb2ozUEsEFA-1
Received: by mail-ej1-f65.google.com with SMTP id s21so7256477ejd.2
	for <linux-audit@redhat.com>; Sun, 17 May 2020 14:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rSquCSsnJ6NvsrBY7NbLkK4MvG5gUL70RjYL2VmELos=;
	b=f/XZ5EJ4hoCCNf8wFRL+j904F3IJfTPW8D6FB2NOaT3M0ewRjHrFwQrPb0oAVOgxQi
	F3u08O+BFJHsbrvDHxWkXVTl99a1os9FkrLTJc8FciM7Nc6DqQon/DrLixaasVwGOK63
	NKVJKXyl0IK9aTZL2O6YotNHu+7ld7/9IB5t3AGaceo/qLjyOluur10phSJ7Frd+K6P4
	IpRpE4ARa+mkBL5ObKcV1arex23r9UIqWPKb6wcgIue7Lj3NBC4OyXCTXjfmUlzRdTAW
	OypKKFn+tXcShl+NbMQWxSeuzA/J5vlprlhCnGfCQx+50RrzA1yM9J8asAm9zWg2sYUz
	sG5w==
X-Gm-Message-State: AOAM531RtI0B1jhN/wcwr2wCuMpGL6SujrDt5n48Kl+9JkcqJiO5js+c
	F/Q8Gwd7JIesJmPlfO4xkNPsVy3qzEBAOSo3uD9Lv4A=
X-Google-Smtp-Source: ABdhPJwAgAvlTYQNB3/EkdOaYTaBBhtFPctRWumfa3FwIEdOBrUjFp/+OmrQ0WgBizoZ/B2GtELt300YKdd59YHjOww=
X-Received: by 2002:a17:906:31da:: with SMTP id
	f26mr12224726ejf.308.1589752565845; 
	Sun, 17 May 2020 14:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587500467.git.rgb@redhat.com>
	<b8ba40255978a73ea15e3859d5c945ecd5fede8e.1587500467.git.rgb@redhat.com>
	<CAHC9VhR9sNB58A8uQ4FNgAXOgVJ3RaWF4y5MAo=3mcTojaym0Q@mail.gmail.com>
	<20200517141515.qqx3jx5ulb2546tx@madcap2.tricolour.ca>
	<e536047e-f08d-ba1e-32eb-738772ad42c4@schaufler-ca.com>
In-Reply-To: <e536047e-f08d-ba1e-32eb-738772ad42c4@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 17 May 2020 17:55:54 -0400
Message-ID: <CAHC9VhSpkqKDh2ZXaMOnZ3PiZ6mo2cbgJ-_G43YCn=16p1aHUg@mail.gmail.com>
Subject: Re: [PATCH ghak25 v4 3/3] audit: add subj creds to NETFILTER_CFG
	record to cover async unregister
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, May 17, 2020 at 2:26 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 5/17/2020 7:15 AM, Richard Guy Briggs wrote:
> > On 2020-04-28 18:25, Paul Moore wrote:
> >> On Wed, Apr 22, 2020 at 5:40 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >>> Some table unregister actions seem to be initiated by the kernel to
> >>> garbage collect unused tables that are not initiated by any userspace
> >>> actions.  It was found to be necessary to add the subject credentials to
> >>> cover this case to reveal the source of these actions.  A sample record:
> >>>
> >>>   type=NETFILTER_CFG msg=audit(2020-03-11 21:25:21.491:269) : table=nat family=bridge entries=0 op=unregister pid=153 uid=root auid=unset tty=(none) ses=unset subj=system_u:system_r:kernel_t:s0 comm=kworker/u4:2 exe=(null)
> >> [I'm going to comment up here instead of in the code because it is a
> >> bit easier for everyone to see what the actual impact might be on the
> >> records.]
> >>
> >> Steve wants subject info in this case, okay, but let's try to trim out
> >> some of the fields which simply don't make sense in this record; I'm
> >> thinking of fields that are unset/empty in the kernel case and are
> >> duplicates of other records in the userspace/syscall case.  I think
> >> that means we can drop "tty", "ses", "comm", and "exe" ... yes?
> >>
> >> While "auid" is a potential target for removal based on the
> >> dup-or-unset criteria, I think it falls under Steve's request for
> >> subject info here, even if it is garbage in this case.
> > Can you explain why auid falls under this criteria but ses does not if
> > both are unset?  If auid is unset then we know ses is unset?  If subj
> > contains *:kernel_t:* then uid can also be dropped even though it is
> > set, no?
>
> That's going to be up to the security module. SELinux may know that a
> task with a subj= *:kernel_t:* doesn't need an uid, but that's not
> going to be true with Smack, or if in the (distant?) future you
> have both SELinux and Smack. Creating a way for the security module
> to inform the audit system that it believes fields are unnecessary
> sounds tricky. Not to mention that it's likely to create cases where
> the audit user-space has to know which, if any, security modules are
> active.

It is important to remember that in the case we are talking about here
the record/event is not triggered by any user action so there is
limited to no useful subject information to log.  There *may* be an
argument to be made for logging the LSM subject info (although I
personally feel that to be a weak argument), but there is no reason to
log any of the traditional DAC UID/GID/etc. subject info as it simply
doesn't exist in this case.  When the UID/GID/etc. information does
exist, it would be logged via other records in the same event, e.g.
the SYSCALL record.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

