Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6D91C1A85
	for <lists+linux-audit@lfdr.de>; Fri,  1 May 2020 18:24:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588350245;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KZQGOz1tO8z1EuKsK4H+mEhZvFgq7cw1AvcigSaQHKQ=;
	b=RhaY3YgZelF/3nWKZqgB00EWdZpf2Kb/63MqFOlMafRhxie+bhZRJfy+RssnTZBJ7uDnPc
	6uv5EtoRFUnV1LJRoGSmZUwYZVcDDqn0qiE+AgjOzmh51jdg8AAqD1yeO1vnXLh8mi2WZT
	KG/NQqn3QmU26A7pE+bIoZW/7vhaF1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-Uhlifxf4NbG24PvvYFc5DQ-1; Fri, 01 May 2020 12:24:02 -0400
X-MC-Unique: Uhlifxf4NbG24PvvYFc5DQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A248A801504;
	Fri,  1 May 2020 16:23:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DA6C2B4D0;
	Fri,  1 May 2020 16:23:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA4561809542;
	Fri,  1 May 2020 16:23:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 041GNUPr006275 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 1 May 2020 12:23:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A06D61285C0; Fri,  1 May 2020 16:23:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C7CB1285C2
	for <linux-audit@redhat.com>; Fri,  1 May 2020 16:23:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B3BA18E05E3
	for <linux-audit@redhat.com>; Fri,  1 May 2020 16:23:30 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-131-7cCL9JXKO9CyyTyZ7TM6fQ-1; Fri, 01 May 2020 12:23:27 -0400
X-MC-Unique: 7cCL9JXKO9CyyTyZ7TM6fQ-1
Received: by mail-ed1-f66.google.com with SMTP id w2so7626865edx.4
	for <linux-audit@redhat.com>; Fri, 01 May 2020 09:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jfkQqP4P46nAK7oHXekeHfYjV+lTMmLOA7ipwLh/Dr8=;
	b=imiqYhzNy7VGhuefiGJxMnmjPhf/ke0BEQcWkep9PvnysDpCIVd/osyJAEMKpOEuuH
	j+P/qeVr0hnx85qD27EQJHvYZUFUOqTzzLMOli9ZSR7Vp82H9EMDhcJaeN7AXrW+aiiz
	jYuazM4he54s2NBDDYSWyygsVbWoyNVwyHz69IZx40MRpN4jW45ZqaYNKDurfC7ftex5
	JGvpdfm9MtkhWL/rVleqsHrZsFPThKZKzZbEZXfKCaYa5oXzmai1KyfolPgaL4/RuF5d
	PUAf4zyFdCww5ZsTxQWFhXe1XDwa5tnClPN3EL2PGIdvHt/SXRwu3WUL3z/ebcyFVzVD
	mLBg==
X-Gm-Message-State: AGi0PuZdkioydQXknnqo22peZuuM6jYwL5KLmcIyZugtIyhv2juhNA10
	OnN24pU5IAj8pCRgLf4BOrFF3ZfNj0QBlkUsA/qr
X-Google-Smtp-Source: APiQypK825QibI3Ui9tCm2G1lExv4S+wdR3Bg+ka7wXCBeYqlb2bim0M0WRbqiTf2qPAhN/AhIew2jU+IiK7WSk1z7A=
X-Received: by 2002:aa7:cb0f:: with SMTP id s15mr4169202edt.164.1588350206362; 
	Fri, 01 May 2020 09:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587500467.git.rgb@redhat.com>
	<CAHC9VhR9sNB58A8uQ4FNgAXOgVJ3RaWF4y5MAo=3mcTojaym0Q@mail.gmail.com>
	<20200429143146.3vlcmwvljo74ydb4@madcap2.tricolour.ca>
	<3348737.k9gCtgYObn@x2>
	<20200429213247.6ewxqf66i2apgyuz@madcap2.tricolour.ca>
In-Reply-To: <20200429213247.6ewxqf66i2apgyuz@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 1 May 2020 12:23:15 -0400
Message-ID: <CAHC9VhRv4GdaBm5ooi5D-j4CBvoOD5L9ab+QPgxhLudtwG=Nsw@mail.gmail.com>
Subject: Re: [PATCH ghak25 v4 3/3] audit: add subj creds to NETFILTER_CFG
	record to cover async unregister
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 041GNUPr006275
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 29, 2020 at 5:33 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-04-29 14:47, Steve Grubb wrote:
> > On Wednesday, April 29, 2020 10:31:46 AM EDT Richard Guy Briggs wrote:
> > > On 2020-04-28 18:25, Paul Moore wrote:
> > > > On Wed, Apr 22, 2020 at 5:40 PM Richard Guy Briggs <rgb@redhat.com>
> > wrote:
> > > > > Some table unregister actions seem to be initiated by the kernel to
> > > > > garbage collect unused tables that are not initiated by any userspace
> > > > > actions.  It was found to be necessary to add the subject credentials
> > > > > to  cover this case to reveal the source of these actions.  A sample
> > > > > record:
> > > > >   type=NETFILTER_CFG msg=audit(2020-03-11 21:25:21.491:269) : table=nat
> > > > >   family=bridge entries=0 op=unregister pid=153 uid=root auid=unset
> > > > >   tty=(none) ses=unset subj=system_u:system_r:kernel_t:s0
> > > > >   comm=kworker/u4:2 exe=(null)>
> > > > [I'm going to comment up here instead of in the code because it is a
> > > > bit easier for everyone to see what the actual impact might be on the
> > > > records.]
> > > >
> > > > Steve wants subject info in this case, okay, but let's try to trim out
> > > > some of the fields which simply don't make sense in this record; I'm
> > > > thinking of fields that are unset/empty in the kernel case and are
> > > > duplicates of other records in the userspace/syscall case.  I think
> > > > that means we can drop "tty", "ses", "comm", and "exe" ... yes?
> > >
> > > From the ghak28 discussion, this list and order was selected due to
> > > Steve's preference for the "kernel" record convention, so deviating from
> > > this will create yet a new field list.  I'll defer to Steve on this.  It
> > > also has to do with the searchability of fields if they are missing.
> > >
> > > I do agree that some fields will be superfluous in the kernel case.
> > > The most important field would be "subj", but then "pid" and "comm", I
> > > would think.  Based on this contents of the "subj" field, I'd think that
> > > "uid", "auid", "tty", "ses" and "exe" are not needed.
> >
> > We can't be adding deleting fields based on how its triggered. If they are
> > unset, that is fine. The main issue is they have to behave the same.
>
> I don't think the intent was to have fields swing in and out depending
> on trigger.  The idea is to potentially permanently not include them in
> this record type only.  The justification is that where they aren't
> needed for the kernel trigger situation it made sense to delete them
> because if it is a user context event it will be accompanied by a
> syscall record that already has that information and there would be no
> sense in duplicating it.

Yes, exactly.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

