Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 850461AE81C
	for <lists+linux-audit@lfdr.de>; Sat, 18 Apr 2020 00:22:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587162153;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VslEZ5kL3PWeVkpfNLZGxj/ncx8yldvkoLPuNjnkuJU=;
	b=IAUTzGXl27rQv/sR1aJd9tBOm7sestkXqFaS0h/KYbHjTSbZGJIDU6ikQ10n0Y9RiEAh6p
	AC4qdwgZKXIGwBn7tV6igZdGu+t882l4Q/pOhp/Nmp9Zgc6UrhEmKoE9fMQZkkuOHaiwim
	FGejqLcf4DbYiNUfDZK33ouBoL5MEm0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-wPgusDBYNbGSLW7m5RtKyA-1; Fri, 17 Apr 2020 18:22:31 -0400
X-MC-Unique: wPgusDBYNbGSLW7m5RtKyA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CED611005509;
	Fri, 17 Apr 2020 22:22:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49E517E7CF;
	Fri, 17 Apr 2020 22:22:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE7A91809567;
	Fri, 17 Apr 2020 22:22:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03HMMFow006971 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 17 Apr 2020 18:22:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A24822166B33; Fri, 17 Apr 2020 22:22:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ED742166B30
	for <linux-audit@redhat.com>; Fri, 17 Apr 2020 22:22:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 797D2185A78E
	for <linux-audit@redhat.com>; Fri, 17 Apr 2020 22:22:13 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-107-QSyQbmuzPnutdTETZyHNyA-1; Fri, 17 Apr 2020 18:22:11 -0400
X-MC-Unique: QSyQbmuzPnutdTETZyHNyA-1
Received: by mail-ed1-f68.google.com with SMTP id i7so2647793edq.3
	for <linux-audit@redhat.com>; Fri, 17 Apr 2020 15:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=w/f6Gl9VweQh9zLrWdi52uB3NRZA6g/9Wq4OQPDCCok=;
	b=sdBBlgKiAJXWnwyzMeflzdFZVyzklYDg31EMDd2R+J0yUCmTj2/I9aolOmuIBJ6O9h
	4rvWPKgJSGouBYwnEUuNktWMjEXSVunp1MDpROeMnKaZkzumZCwjQzL3jmyQS69dsrDZ
	D7Y+221FWlnBDFwO1v8q4stD0LYb1YxT5qsg/vz3VLvrZFPAZAgozyhJ4Ksem0xBxz4c
	aMWasxwyg6uU0eUGAU3g3/kjmP3YqfiwHtRfzXqRjS86pMudy9KMGP8BCVy6BgUJD+wd
	IZab2x0mqmJ1YTBF0zW/DFA4QM7lsfCfo/0kxLij/1pieLU0psBwwZzj19qKW+xU9wx2
	ulug==
X-Gm-Message-State: AGi0Pub3wLOYZn06fZ2Govwxbert8M135F4Rf7KxiS9KzfhjYynuhTjz
	RyQR3kA9JunPSlAw1aICP5jysw/R4rbBi2JIg/WT
X-Google-Smtp-Source: APiQypJsbxCVHQN8UqEDhRhDcXP36MYF6Zp4aTeC61C3FS6fTD07E25L1PXAFJR2/Y6qCsXxV7ziDl/GtGSB95wAMiE=
X-Received: by 2002:a05:6402:1215:: with SMTP id
	c21mr5347669edw.128.1587162129901; 
	Fri, 17 Apr 2020 15:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200402141319.28714-1-vdronov@redhat.com>
	<2d7174b1-115f-b86f-8054-a5caef4b69ff@schaufler-ca.com>
	<1800109401.20260657.1585845081366.JavaMail.zimbra@redhat.com>
	<20200409215056.qa5uso6rr57y4joo@madcap2.tricolour.ca>
In-Reply-To: <20200409215056.qa5uso6rr57y4joo@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 17 Apr 2020 18:21:59 -0400
Message-ID: <CAHC9VhRG-W5ni6jPbtDFbZ=bgSEaoweMrf0ZMJJi_3-sC+u4QQ@mail.gmail.com>
Subject: Re: [PATCH ghak96] audit: set cwd in audit context for file-related
	LSM audit records
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03HMMFow006971
X-loop: linux-audit@redhat.com
Cc: James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	Vladis Dronov <vdronov@redhat.com>, "Serge E . Hallyn" <serge@hallyn.com>
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

On Thu, Apr 9, 2020 at 5:51 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-04-02 12:31, Vladis Dronov wrote:
> > Hello, Casey, all,
> >
> > ----- Original Message -----
> > > From: "Casey Schaufler" <casey@schaufler-ca.com>
> > > Subject: Re: [PATCH ghak96] audit: set cwd in audit context for file-related LSM audit records
> > >
> > > On 4/2/2020 7:13 AM, Vladis Dronov wrote:
> > > > Set a current working directory in an audit context for the following
> > > > record
> > > > types in dump_common_audit_data(): LSM_AUDIT_DATA_PATH,
> > > > LSM_AUDIT_DATA_FILE,
> > > > LSM_AUDIT_DATA_IOCTL_OP, LSM_AUDIT_DATA_DENTRY, LSM_AUDIT_DATA_INODE so a
> > > > separate CWD record is emitted later.
> > > >
> > > > Link: https://github.com/linux-audit/audit-kernel/issues/96
> > >
> > > I don't have a problem with the patch, but it sure would be nice
> > > if you explained why these events "could use a CWD record".
> >
> > (adding Richard Guy Briggs <rgb@redhat.com> which I should have been done earlier)
> >
> > I would agree, adding "cwd=" field in the LSM record itself is simpler to me.
>
> We already have a CWD record to record this information.  It usually
> accompanies an AUDIT_PATH record, but the intent is that it accompanies
> any event that has filesystem pathnames in path= or name= fields in
> records to help understand the command's context relative to the
> filesystem.

Yes, I think the right thing to do here is simply generate a CWD
record in these cases.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

