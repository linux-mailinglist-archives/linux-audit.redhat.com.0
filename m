Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA786AD79
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jul 2019 19:13:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2DA27308FB93;
	Tue, 16 Jul 2019 17:13:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4ABB60920;
	Tue, 16 Jul 2019 17:13:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B78934E58E;
	Tue, 16 Jul 2019 17:13:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6GHD1hw008087 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jul 2019 13:13:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A856E60C44; Tue, 16 Jul 2019 17:13:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A32EF60C67
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 17:12:59 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF8DB3093382
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 17:12:57 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id p17so20747501ljg.1
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 10:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZdyasQC+3ix3HIRqg+gRZPFKqSgXSBZyXPHMxnMlASk=;
	b=CSn66QYjgyyAbXYdJhLkryqlvttjNbOSr5QasP+TA763uaZAcQ+HyqhO16PJZdsVKf
	pnCfj9DfXmSa9bIPgTiqCve9+4mc1w0jdOXc78UIiFlyHs0tqmP8G/c+mIF/i0b4Dxc/
	9kDYIsawHvqBZMsYIiyshMxCgAMpbvS/TyINkg0whdtcpq5613JAKmF8QJSNPo9/aW2W
	//lNoqkgooVUx+lmc79oupNEyYhzUr7wQkPLJNUn88DXXPWhHWodppOyqbkE5wBwOPSD
	sXqbnPrUqFFZanxL9Uy8YfQgjF5LcHbL8WmvWEqP65nALKeKFRzJiAqKAYCOAXB39zmv
	WWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZdyasQC+3ix3HIRqg+gRZPFKqSgXSBZyXPHMxnMlASk=;
	b=A5I56uEEXF66JyitdeAPOzXx0SJiZyKYz8pT6+wWQFptt/J4Ty1F5YfJ3h3jad5j3U
	jL4eDTwK8hmf1gSWERtt65Ry4aAs6GgLWFyWLa8OfpLIHckudvp4aJDR6ywJrgh7aE1y
	WHPp95q8lp1mbt0zxAg+55SPjA9LW3trvXV/siQ19Q/8JUVLrkRkyUL/HMhUM/q7GQ2y
	zZDFXfn5ftW6Q5qUp6fQVZprUr3rfaacWSQwFFiny4lCStvaiZ/bKEXgk51NAm9rILXX
	v3rH3TD2ps6GCsREjsCJc8ANlKTLGf8GvhlNyISvQNk3b4B5DsbqYWXzrBq/7BxcTeGG
	nYhQ==
X-Gm-Message-State: APjAAAVwyM9zN9LEhwYAH2BdD8W6LX1xxdqpnd0RgsIti7MQkmahA1lg
	WtRyExAd4wMXxGk7EbXGivxXe/sE5E2NZtXpAA==
X-Google-Smtp-Source: APXvYqzDeqwQRe0OtjHoZdCpIi1hHSVm9v1Q0mz8uk/RjOxD7URSq7eY3CeLBEZzMBRjxgQ49sYONkuCrMEivpqDSis=
X-Received: by 2002:a2e:5bdd:: with SMTP id m90mr17426348lje.46.1563297176198; 
	Tue, 16 Jul 2019 10:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
	<c46932ec-e38e-ba15-7ceb-70e0fe0ef5dc@schaufler-ca.com>
	<CAHC9VhQ08LKUmYS8ho_0-uDUFakPPq1bvR6JwWiLUrnwaRV6Aw@mail.gmail.com>
	<1979804.kRvuSoDnao@x2>
In-Reply-To: <1979804.kRvuSoDnao@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 16 Jul 2019 13:12:44 -0400
Message-ID: <CAHC9VhSELVZN8feH56zsANqoHu16mPMD04Ww60W=r6tWs+8WnQ@mail.gmail.com>
Subject: Re: Preferred subj= with multiple LSMs
To: Steve Grubb <sgrubb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 16 Jul 2019 17:12:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Tue, 16 Jul 2019 17:12:58 +0000 (UTC) for IP:'209.85.208.172'
	DOMAIN:'mail-lj1-f172.google.com'
	HELO:'mail-lj1-f172.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.208.172 mail-lj1-f172.google.com 209.85.208.172
	mail-lj1-f172.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Tue, 16 Jul 2019 17:13:13 +0000 (UTC)

On Mon, Jul 15, 2019 at 6:56 PM Steve Grubb <sgrubb@redhat.com> wrote:
> On Monday, July 15, 2019 5:28:56 PM EDT Paul Moore wrote:
> > On Mon, Jul 15, 2019 at 3:37 PM Casey Schaufler <casey@schaufler-ca.com>
> wrote:
> > > On 7/15/2019 12:04 PM, Richard Guy Briggs wrote:
> > > > On 2019-07-13 11:08, Steve Grubb wrote:

...

> > > > Steve's answer is the obvious one, ideally allocating a seperate range
> > > > to each LSM with each message type having its own well defined format.
> > >
> > > It doesn't address the issue of success records, or records
> > > generated outside the security modules.
> >
> > Yes, exactly.  The individual LSM will presumably will continue to
> > generate their own audit records as they do today and I would imagine
> > that the subject and object fields could remain as they do today for
> > the LSM specific records.
> >
> > The trick is the other records which are not LSM specific but still
> > want to include subject and/or object information.  Unfortunately we
> > are stuck with some tough limitations given the current audit record
> > format and Steve's audit userspace tools;
>
> Not really. We just need to approach the problem thinking about how to make
> it work based on how things currently work.

I suppose it is all somewhat "subjective" - bad joke fully intended :)
- with respect to what one considers good/bad/limiting.  My personal
view is that an ideal solution would allow for multiple independent
subj/obj labels without having to multiplex on a single subj/obj
field.  My gut feeling is that this would confuse your tools, yes?

> For example Casey had a list of possible formats. Like this one:
>
> Option 3:
>         lsms=selinux,apparmor subj=x:y:z:s:c subj=a
>
> I'd suggest something almost like that. The first field could be a map to
> decipher the labels. Then we could have a comma separated list of labels.
>
> lsms=selinux,apparmor subj=x:y:z:s:c,a

Some quick comments:

* My usual reminder that new fields for existing audit records must be
added to the end of the record.

* If we are going to multiplex the labels on a single field (more on
that below) I might suggest using "subj_lsms" instead of "lsms" so we
leave ourself some wiggle room in the future.

* Multiplexing on a single "subj" field is going to be difficult
because picking the label delimiter is going to be a pain.  For
example, in the example above a comma is used, which at the very least
is a valid part of a SELinux label and I suspect for Smack as well
(I'm not sure about the other LSMs).  I suspect the only way to parse
out the component labels would be to have knowledge of the LSMs in
use, as well as the policies loaded at the time the audit record was
generated.

This may be a faulty assumption, but assuming your tools will fall
over if they see multiple "subj" fields, could we do something like
the following (something between option #2 and #3):

  subj1_lsm=smack subj1=<smack_label> subj2_lsm=selinux
subj2=<selinux_label> ...

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
