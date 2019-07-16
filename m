Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C15A16ADCE
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jul 2019 19:43:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7EE87368E3;
	Tue, 16 Jul 2019 17:43:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6188B19C71;
	Tue, 16 Jul 2019 17:43:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3881B1800207;
	Tue, 16 Jul 2019 17:43:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6GHhZEL013265 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jul 2019 13:43:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 64E445D72E; Tue, 16 Jul 2019 17:43:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F84D5D721
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 17:43:33 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D076346673
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 17:43:31 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id 62so9478609lfa.8
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 10:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7eQh2FsjarxmlyZKMIfDjcEJRx+HYEFFQHdnWbI2w9g=;
	b=NGLcJAMA33cMJ1BJ47creGwoHRcgerp0L/VkkU8hB85Y1xRCqWJhPqFZH35s3y/9OF
	DI3g4bBnpc7c/DebOc69WwpQg22iPH5IZu+F0AGueoF3yaqyxpPpeNKOrcYq8ervg0Kx
	R2UxQQirwo1hJFhFqEB9wAFI0p5/7FTY0UJJ4qaSXqYB6enK+Nuynb8ars5UGRwbbMWQ
	3UhmzXzST/XABUXA0eyxMPlEU34RpvdQxVQn6YeEsFQORJvRbvTyyCnBlVSxj2KazrpN
	dARrgc4JM7+RO04Zg5ynTT4O5YjFEabeod9Q1CDBz/tEQH8A1ydFNnC+IozO/B6AkDkT
	j9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7eQh2FsjarxmlyZKMIfDjcEJRx+HYEFFQHdnWbI2w9g=;
	b=XIC7Rin59aKB27Oe5anPObsIlToe90Zld2VDHzqBodSPXtGTi3jdsutmWzpXc75PVp
	q9YIGkHT6PX14AJATWgu8k+V/2BPy0B1O1jJ45axC51W4/Obg6sp7aIdjtZKNk/r8dN+
	6tEKL3N6NXdc6vD01WyriYe5NOhlyofgGpfZZUEwMZ6dRijSOKqYs6h57S9vXaNbyfpq
	VSlM9gt2TwXIqqPvwJ2iAnprnEeJ5+sppDjf33SxKHmQyCV0F3bzVIzz2xo6qJMBdYGn
	Ttch7YLbvslNaNEyTSAni7Q2QC0g4HSG2CwHBskwleuhqbhO+GY8IXsSfZx89p+Wbd2j
	lD8A==
X-Gm-Message-State: APjAAAVO9wOXiQVoVLBJFk1N/cMMY85LhSHx2BAXDh/uXzAea8DxL2TV
	rTx3Uou74xLb8tqbbUp/lxBfFivDzVjHnZLcgA==
X-Google-Smtp-Source: APXvYqxE+xTVNhGGq4k8vPE5IlwMtAXONeRrUaP9Egt7KBkW1T88YlZNfdM2VwVeJTYytw2eY1CXff+OE/hOtd0+/YQ=
X-Received: by 2002:a19:5e10:: with SMTP id s16mr14984006lfb.13.1563299010074; 
	Tue, 16 Jul 2019 10:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
	<c46932ec-e38e-ba15-7ceb-70e0fe0ef5dc@schaufler-ca.com>
	<CAHC9VhQ08LKUmYS8ho_0-uDUFakPPq1bvR6JwWiLUrnwaRV6Aw@mail.gmail.com>
	<1979804.kRvuSoDnao@x2>
	<CAHC9VhSELVZN8feH56zsANqoHu16mPMD04Ww60W=r6tWs+8WnQ@mail.gmail.com>
	<c993f63a-7c2d-c6c8-cfa6-3cfba410770d@schaufler-ca.com>
In-Reply-To: <c993f63a-7c2d-c6c8-cfa6-3cfba410770d@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 16 Jul 2019 13:43:18 -0400
Message-ID: <CAHC9VhSTwvueKcK2yhckwayh9YGou7gt2Gny36DOTaNkrck+Mg@mail.gmail.com>
Subject: Re: Preferred subj= with multiple LSMs
To: Casey Schaufler <casey@schaufler-ca.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 16 Jul 2019 17:43:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Tue, 16 Jul 2019 17:43:32 +0000 (UTC) for IP:'209.85.167.45'
	DOMAIN:'mail-lf1-f45.google.com' HELO:'mail-lf1-f45.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.167.45 mail-lf1-f45.google.com 209.85.167.45
	mail-lf1-f45.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 16 Jul 2019 17:43:49 +0000 (UTC)

On Tue, Jul 16, 2019 at 1:30 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 7/16/2019 10:12 AM, Paul Moore wrote:
> > On Mon, Jul 15, 2019 at 6:56 PM Steve Grubb <sgrubb@redhat.com> wrote:
> >> On Monday, July 15, 2019 5:28:56 PM EDT Paul Moore wrote:
> >>> On Mon, Jul 15, 2019 at 3:37 PM Casey Schaufler <casey@schaufler-ca.com>
> >> wrote:
> >>>> On 7/15/2019 12:04 PM, Richard Guy Briggs wrote:
> >>>>> On 2019-07-13 11:08, Steve Grubb wrote:
> > ...
> >
> >>>>> Steve's answer is the obvious one, ideally allocating a seperate range
> >>>>> to each LSM with each message type having its own well defined format.
> >>>> It doesn't address the issue of success records, or records
> >>>> generated outside the security modules.
> >>> Yes, exactly.  The individual LSM will presumably will continue to
> >>> generate their own audit records as they do today and I would imagine
> >>> that the subject and object fields could remain as they do today for
> >>> the LSM specific records.
> >>>
> >>> The trick is the other records which are not LSM specific but still
> >>> want to include subject and/or object information.  Unfortunately we
> >>> are stuck with some tough limitations given the current audit record
> >>> format and Steve's audit userspace tools;
> >> Not really. We just need to approach the problem thinking about how to make
> >> it work based on how things currently work.
> > I suppose it is all somewhat "subjective" - bad joke fully intended :)
> > - with respect to what one considers good/bad/limiting.  My personal
> > view is that an ideal solution would allow for multiple independent
> > subj/obj labels without having to multiplex on a single subj/obj
> > field.  My gut feeling is that this would confuse your tools, yes?
> >
> >> For example Casey had a list of possible formats. Like this one:
> >>
> >> Option 3:
> >>         lsms=selinux,apparmor subj=x:y:z:s:c subj=a
> >>
> >> I'd suggest something almost like that. The first field could be a map to
> >> decipher the labels. Then we could have a comma separated list of labels.
> >>
> >> lsms=selinux,apparmor subj=x:y:z:s:c,a
> > Some quick comments:
> >
> > * My usual reminder that new fields for existing audit records must be
> > added to the end of the record.
> >
> > * If we are going to multiplex the labels on a single field (more on
> > that below) I might suggest using "subj_lsms" instead of "lsms" so we
> > leave ourself some wiggle room in the future.
> >
> > * Multiplexing on a single "subj" field is going to be difficult
> > because picking the label delimiter is going to be a pain.  For
> > example, in the example above a comma is used, which at the very least
> > is a valid part of a SELinux label and I suspect for Smack as well
> > (I'm not sure about the other LSMs).  I suspect the only way to parse
> > out the component labels would be to have knowledge of the LSMs in
> > use, as well as the policies loaded at the time the audit record was
> > generated.
> >
> > This may be a faulty assumption, but assuming your tools will fall
> > over if they see multiple "subj" fields, could we do something like
> > the following (something between option #2 and #3):
> >
> >   subj1_lsm=smack subj1=<smack_label> subj2_lsm=selinux
> > subj2=<selinux_label> ...
>
> If it's not a subj= field why use the indirection?
>
>         subj_smack=<smack_label> subj_selinux=<selinux_label>
>
> would be easier.

Good point, that looks reasonable to me.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
