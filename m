Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFDC180AB9
	for <lists+linux-audit@lfdr.de>; Tue, 10 Mar 2020 22:43:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583876622;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6k2li/cp+NGmPaCmJ1jbaYaavubT8VKomg4NS40JPfY=;
	b=JHmK3G6y0LBIsHGmsWGEhF6/wB+TJppXDKKVKgv0KYxzprXliFz6/ypfVcCnN8AUlS/6DA
	P7qC25jteXtqVLJLhuDLlYpnYX47uq8jDAQHdGmczClyqO+yOzLFU0qktmAmwtGMus3am/
	6naXTmi0Cy7byFyVsYs3PJpLk7TS5aw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-l-65CIBQMImvQt5_yt8yQQ-1; Tue, 10 Mar 2020 17:43:37 -0400
X-MC-Unique: l-65CIBQMImvQt5_yt8yQQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE6A5801E6D;
	Tue, 10 Mar 2020 21:43:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78520909E9;
	Tue, 10 Mar 2020 21:43:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A7BFF86A10;
	Tue, 10 Mar 2020 21:43:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02ALh57d015548 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 10 Mar 2020 17:43:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F35C8F4D4B; Tue, 10 Mar 2020 21:43:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED561F84F0
	for <linux-audit@redhat.com>; Tue, 10 Mar 2020 21:43:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF8F6101A55D
	for <linux-audit@redhat.com>; Tue, 10 Mar 2020 21:43:02 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-195-BvCLXas-Pzefn5q9qAwkfA-1; Tue, 10 Mar 2020 17:43:00 -0400
X-MC-Unique: BvCLXas-Pzefn5q9qAwkfA-1
Received: by mail-ed1-f42.google.com with SMTP id dc19so218760edb.10
	for <linux-audit@redhat.com>; Tue, 10 Mar 2020 14:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EJML0BofqucT/jZjhfGnVkELRi3YEpRBvc8rWE2xC/Q=;
	b=CyUg2QHrCbxdP7hWcnymgP2R+pcuV9WbEBx4pf+Ag1ktv27ZwdV85Lb0xS52X5K//D
	B52cQAj7KqY8i++ZX206m7oxrj8GexY/BQeLKALUrjFhNCjPGmuWLEulOdZ5GUypEpE0
	2U/5rKwDrsEcKISvKDlWe+xyUbHE/oTPbnYO5Jqaxi8RRQSr+r4YukbZJ7NAzs1iT5aZ
	LVbLnIEoR5whoeR5/Fe4xPoaYUU7Sr1Ux4ywwJMNmz+AlAzpNNEbTpC2eNnprZ2RJkF2
	uVY4kmb07Nm0YU3tP08+g1zLmN5RUpwMzn1pR/DMn0rJRimjei0JiESbTMdHeZPYDvH5
	O9SQ==
X-Gm-Message-State: ANhLgQ0SNRQQxsEQtrqxSqHsf6GtqUWQTwiqofi2bQga6yrLuZKBvzQ7
	ATcpfooP2vIa+i6VpgbD5VtkMO6vpyqsuWH7IsZJAuY=
X-Google-Smtp-Source: ADFU+vtq578lHHSxMBadIdzBgXGMldlBdTWVnCQ+5WrTvvyqBJNkbl0Z8XGBRKDohO9p2i8qt+Lm6Uj3ooWAOrpw8y8=
X-Received: by 2002:a17:907:9d8:: with SMTP id
	bx24mr21404208ejc.271.1583876578608; 
	Tue, 10 Mar 2020 14:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200222000407.110158-1-casey@schaufler-ca.com>
	<20200222000407.110158-14-casey@schaufler-ca.com>
	<CAHC9VhSrjdzL_4s1kPvuc6PxOQi5LmsxRaW10pYjDM2_nbstJw@mail.gmail.com>
	<42b3a4f0-c6ee-516a-7d10-726222c42b78@schaufler-ca.com>
	<CAHC9VhRiqHAJLBNLxLrFHsevSdV0bG_P_YFWV6Kw00ZGTKduHw@mail.gmail.com>
	<c05f3146-ae38-51bc-c5dc-cc4e21ba8447@schaufler-ca.com>
In-Reply-To: <c05f3146-ae38-51bc-c5dc-cc4e21ba8447@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 10 Mar 2020 17:42:47 -0400
Message-ID: <CAHC9VhQNBoJTA8eLC3e1ZZhc4dNtaXHUXm_a_DVOVHwackm9HA@mail.gmail.com>
Subject: Re: [PATCH v15 21/23] Audit: Include object data for all security
	modules
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02ALh57d015548
X-loop: linux-audit@redhat.com
Cc: casey.schaufler@intel.com, linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 9, 2020 at 7:01 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 3/9/2020 10:59 AM, Paul Moore wrote:
> > On Mon, Mar 9, 2020 at 1:45 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >> On 3/6/2020 6:31 PM, Paul Moore wrote:
> >>> Either way, the "obj=" field should stay where it is, but the
> >>> "obj_XXX=" fields need to find their way to the end of the record.
> >> As Steve pointed out, there may be a bigger issue here. If the additional
> >> fields aren't going to fit in MAX_AUDIT_MESSAGE_LENGTH bytes another
> >> format may be required. I had hoped that perhaps obj_selinux= might count
> >> as a refinement to obj= and hence not be considered a new field, but
> >> it looks like that's not flying.
> > Regardless, the field placement guidance remains the same.
>
> I hear that clearly. End of record.
>
>
> > As far as the record limitation; yes, Steve's audit userspace does
> > have a limit, but I do wonder how limiting an 8k record size really is
> > for the majority of systems.  My guess is "not too bad".
>
> Two large path names would be the only worrisome case.
> It seems that adding multiple labels will rarely be an issue in
> practice, but if we can avoid the difference between theory and
> practice we'll be ahead.
>
> > If you are
> > concerned about that, I imagine you could always tack on a new record
> > to relevant events with additional LSM subj/obj info.
>
> This seems safest, if doing so would be allowed.

I'm open to other suggestions, although I'm struggling to think of
options that don't massively break compat with older userspace.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

