Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4921E1D7B7E
	for <lists+linux-audit@lfdr.de>; Mon, 18 May 2020 16:41:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589812902;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iJi5x9ekTbzPCrDRsP33ZUc6evuicKEHs3UK6zl2H4Y=;
	b=a6cinoAp4hg4s5x6gkbwekSopDHgfZyJhHdTrjhyEtlSb5O9PtZFtGEyvDds3Mg8ZcAfO8
	5nw15/RWVB6JqcjaUWtCNEfOQaPIcZPTsGSLV4vNwgsqgIolA6qS8heV8VxBT7iTVNbQyX
	sidvDS7n8FnjEDP0GuRgtNns67oJh+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-BWAAjmCIPoiwOuoYClNIHQ-1; Mon, 18 May 2020 10:41:39 -0400
X-MC-Unique: BWAAjmCIPoiwOuoYClNIHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9024872FEB;
	Mon, 18 May 2020 14:41:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04119795A9;
	Mon, 18 May 2020 14:41:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 96F9B4ED3C;
	Mon, 18 May 2020 14:41:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04IEf9vW020507 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 18 May 2020 10:41:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4CE5942ADC; Mon, 18 May 2020 14:41:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A9D842AB3
	for <linux-audit@redhat.com>; Mon, 18 May 2020 14:41:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37C9C1801235
	for <linux-audit@redhat.com>; Mon, 18 May 2020 14:41:07 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-324-t0ydeSQrN2yckOjge1kzvA-1; Mon, 18 May 2020 10:41:04 -0400
X-MC-Unique: t0ydeSQrN2yckOjge1kzvA-1
Received: by mail-ed1-f67.google.com with SMTP id d24so728978eds.11
	for <linux-audit@redhat.com>; Mon, 18 May 2020 07:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Y82Wa/YXfbo2pFIdBdGJ5l3oNnVnkoqZdsw/qlj3M4k=;
	b=VSlrYlO9kGEbUepUvhpgG2nTMnLhjG1e/iF7vvM1V34+2FNyWZJ5psiDQjJrpqoTj7
	gypWju9kWL1yaLfIaGC5YPqLCbVni89/8Ki9DW0EDoSX8F8VNwyBJlhgEAvRV0oXPcI3
	IoDYJp3LSl74DhEGRPYIV/JaQf5ep8+aehG8pFwAR9WphMm4OH68DnVJOkdunEDIFFlK
	t8N45+zn1CLEbHdfOU7RPuzhXekGrhJ93+pjby7263OZ/Ku6iRncyC3neY1HaLzrGEET
	o8HItm6tofyQKwFJwzERKRm0t0wBcfooj7aDrwbEhxxhLbSWuhmf7gH647xWMFZwYxzL
	t4lA==
X-Gm-Message-State: AOAM533fPj9B6gn+BRtunlpFACQgaxriq2euMHFYQHPFbwWe6PWQj5LD
	bnatl90ypELsYwjrTPUgagHI7PATSRlw4lZUv1Qv
X-Google-Smtp-Source: ABdhPJyHfxZF3XvBBGLabJM0/+o/cd616yVwBWifbH+ohTirews3dIdk9TsgbL7HFPKM75iLATnYzm6t2UWOCMa2+zo=
X-Received: by 2002:aa7:c887:: with SMTP id p7mr13686147eds.269.1589812862499; 
	Mon, 18 May 2020 07:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587500467.git.rgb@redhat.com>
	<b8ba40255978a73ea15e3859d5c945ecd5fede8e.1587500467.git.rgb@redhat.com>
	<CAHC9VhR9sNB58A8uQ4FNgAXOgVJ3RaWF4y5MAo=3mcTojaym0Q@mail.gmail.com>
	<20200517141515.qqx3jx5ulb2546tx@madcap2.tricolour.ca>
	<CAHC9VhQVRyJ7GRHrujW5Ri-pvBRBgFM2Y8+OYQxca1bUyv2eyg@mail.gmail.com>
	<20200518003920.e6vyzhvadyi5wdjd@madcap2.tricolour.ca>
In-Reply-To: <20200518003920.e6vyzhvadyi5wdjd@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 18 May 2020 10:40:51 -0400
Message-ID: <CAHC9VhTRTm3OywsmZfcjQjfU3OytCbFZ_Qa1uO4LCOEhC=3tnQ@mail.gmail.com>
Subject: Re: [PATCH ghak25 v4 3/3] audit: add subj creds to NETFILTER_CFG
	record to cover async unregister
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, May 17, 2020 at 8:40 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-05-17 17:50, Paul Moore wrote:
> > On Sun, May 17, 2020 at 10:15 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2020-04-28 18:25, Paul Moore wrote:
> > > > On Wed, Apr 22, 2020 at 5:40 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > > Some table unregister actions seem to be initiated by the kernel to
> > > > > garbage collect unused tables that are not initiated by any userspace
> > > > > actions.  It was found to be necessary to add the subject credentials to
> > > > > cover this case to reveal the source of these actions.  A sample record:
> > > > >
> > > > >   type=NETFILTER_CFG msg=audit(2020-03-11 21:25:21.491:269) : table=nat family=bridge entries=0 op=unregister pid=153 uid=root auid=unset tty=(none) ses=unset subj=system_u:system_r:kernel_t:s0 comm=kworker/u4:2 exe=(null)
> > > >
> > > > [I'm going to comment up here instead of in the code because it is a
> > > > bit easier for everyone to see what the actual impact might be on the
> > > > records.]
> > > >
> > > > Steve wants subject info in this case, okay, but let's try to trim out
> > > > some of the fields which simply don't make sense in this record; I'm
> > > > thinking of fields that are unset/empty in the kernel case and are
> > > > duplicates of other records in the userspace/syscall case.  I think
> > > > that means we can drop "tty", "ses", "comm", and "exe" ... yes?
> > > >
> > > > While "auid" is a potential target for removal based on the
> > > > dup-or-unset criteria, I think it falls under Steve's request for
> > > > subject info here, even if it is garbage in this case.
> > >
> > > Can you explain why auid falls under this criteria but ses does not if
> > > both are unset?
> >
> > "While "auid" is a potential target for removal based on the
> > dup-or-unset criteria, I think it falls under Steve's request for
> > subject info here, even if it is garbage in this case."
> >
> > It's a concession to Steve.  As I mentioned previously, I think the
> > subject info is bogus in this case; either it is valid and we get it
> > from the SYSCALL record or it simply isn't present in any meaningful
> > way.
>
> Sorry for being so dense.  I still don't follow your explanation.  You've
> repeated the same paragraph that didn't make sense to me the first time.
>
> What definition of "subject info" are you working with?

The subject is generally the task which is causing the event to occur,
"subject info" would be any such attribute which describes the
subject; examples include LSM label, the various UIDs/GIDs, etc..

Think "current->cred" and you on the right track.

> I had assumed
> it was the set of fields that contain information that came from that
> task's struct task_struct.  Some of those fields contain information
> that isn't helpful.  Why not remove them all rather than keep one that
> still contains no useful information?

Once again - and I don't know how else to explain this to you - I
think it is pointless to record the subject info in this record as we
either have that info from other records in the event or there is no
valid subject info to record.  As you state in the commit description:

  "Some table unregister actions seem to be initiated by the
   kernel to garbage collect unused tables that are not
   initiated by any userspace actions."

>  Or is it a matter of keeping one
> key field that contains no useful information that proves that the rest
> is bogus?  Steve said that daemons leave no useful information in auid
> as well, so I don't see how keeping this field helps us.  My
> understanding is that the subj field's "...:kernel_t:..." is the key
> here and that pid and comm give us a bit more of a clue that it is a
> kernel thread.  Is that correct?  What use does including auid serve
> here?

As I've mentioned in the thread above, including the auid was done as
a concession to Steve, I don't think it serves any useful purpose.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

