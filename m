Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5493A29684B
	for <lists+linux-audit@lfdr.de>; Fri, 23 Oct 2020 03:22:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-0RekMKF2NMS6pJNapcT1hg-1; Thu, 22 Oct 2020 21:22:32 -0400
X-MC-Unique: 0RekMKF2NMS6pJNapcT1hg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AB0D427C4;
	Fri, 23 Oct 2020 01:22:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3756F55776;
	Fri, 23 Oct 2020 01:22:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2CB7258136;
	Fri, 23 Oct 2020 01:22:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09N1LnMn013441 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 22 Oct 2020 21:21:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5E3502157F24; Fri, 23 Oct 2020 01:21:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58C092157F23
	for <linux-audit@redhat.com>; Fri, 23 Oct 2020 01:21:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 094DD185A78B
	for <linux-audit@redhat.com>; Fri, 23 Oct 2020 01:21:46 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-166-nPmjsCavPqSQX8W8EVX__A-1; Thu, 22 Oct 2020 21:21:43 -0400
X-MC-Unique: nPmjsCavPqSQX8W8EVX__A-1
Received: by mail-ej1-f65.google.com with SMTP id z5so69286ejw.7
	for <linux-audit@redhat.com>; Thu, 22 Oct 2020 18:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=aoxn8RZh5GwLX2OTvbY4F3fYrAFarAXAp+zyIW9UVc0=;
	b=P0mPsKWtR154PAQ0eEotcTeXNCPYu9VeEDT3PszEeWXdbzQ4NoTyVJ5KrNf3B8yIr3
	snSF0cLYedVDzUynj1vByO1tha+iOVexApWEc+3eXO2Kiegqy1VSc4eB6CV9C8V0YMrg
	KiQd6fWWoG7R2HQBDtHDOUTwywZB0JxZNTvhLjBM84Eq24ynMfp2vmVCvryYOosElWG+
	ecXhLoJ9XOQ8rAutlDqSlRlVVgXB0/ZPmLSwcmb4oqKJE5ioDPs2KK/09TLijA7hw1ia
	AXhdv1ZlLlbsaSbMFpDes4q0++tfOZXhgzMmbAfdWTTIfh7+xOGt9MHnLaq9U29ChbVv
	73mg==
X-Gm-Message-State: AOAM530L/TKm+vI1TiBFSI79iK72TJqLGxVoeOOygw7Hd2Jt9q0L/9MS
	hFkgWazkjsenMacfDzpvvlRTrWBlDN7cunLS4Zhk
X-Google-Smtp-Source: ABdhPJzDtfnYw+rfKgxc4a8mUFIh6ll/aQ2+0itoJxliGHEeO3L/XBWkrOQEYSixIJb79O9lCBjh5YKgmDlUs8u/x/U=
X-Received: by 2002:a17:906:25cc:: with SMTP id
	n12mr4813564ejb.488.1603416102090; 
	Thu, 22 Oct 2020 18:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593198710.git.rgb@redhat.com>
	<6e2e10432e1400f747918eeb93bf45029de2aa6c.1593198710.git.rgb@redhat.com>
	<CAHC9VhSCm5eeBcyY8bBsnxr-hK4rkso9_NJHJec2OXLu4m5QTA@mail.gmail.com>
	<20200729194058.kcbsqjhzunjpipgm@madcap2.tricolour.ca>
	<CAHC9VhRUwCKBjffA_XNSjUwvUn8e6zfmy8WD203dK7R2KD0__g@mail.gmail.com>
	<20201002195231.GH2882171@madcap2.tricolour.ca>
	<20201021163926.GA3929765@madcap2.tricolour.ca>
In-Reply-To: <20201021163926.GA3929765@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 22 Oct 2020 21:21:31 -0400
Message-ID: <CAHC9VhRb7XMyTrcrmzM3yQO+eLdO_r2+DOLKr9apDDeH4ua2Ew@mail.gmail.com>
Subject: Re: [PATCH ghak90 V9 05/13] audit: log container info of syscalls
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09N1LnMn013441
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 21, 2020 at 12:39 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> Here is an exmple I was able to generate after updating the testsuite
> script to include a signalling example of a nested audit container
> identifier:
>
> ----
> type=PROCTITLE msg=audit(2020-10-21 10:31:16.655:6731) : proctitle=/usr/bin/perl -w containerid/test
> type=CONTAINER_ID msg=audit(2020-10-21 10:31:16.655:6731) : contid=7129731255799087104^3333941723245477888
> type=OBJ_PID msg=audit(2020-10-21 10:31:16.655:6731) : opid=115583 oauid=root ouid=root oses=1 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 ocomm=perl
> type=CONTAINER_ID msg=audit(2020-10-21 10:31:16.655:6731) : contid=3333941723245477888
> type=OBJ_PID msg=audit(2020-10-21 10:31:16.655:6731) : opid=115580 oauid=root ouid=root oses=1 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 ocomm=perl
> type=CONTAINER_ID msg=audit(2020-10-21 10:31:16.655:6731) : contid=8098399240850112512^3333941723245477888
> type=OBJ_PID msg=audit(2020-10-21 10:31:16.655:6731) : opid=115582 oauid=root ouid=root oses=1 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 ocomm=perl
> type=SYSCALL msg=audit(2020-10-21 10:31:16.655:6731) : arch=x86_64 syscall=kill success=yes exit=0 a0=0xfffe3c84 a1=SIGTERM a2=0x4d524554 a3=0x0 items=0 ppid=115564 pid=115567 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=ttyS0 ses=1 comm=perl exe=/usr/bin/perl subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=testsuite-1603290671-AcLtUulY
> ----
>
> There are three CONTAINER_ID records which need some way of associating with OBJ_PID records.  An additional CONTAINER_ID record would be present if the killing process itself had an audit container identifier.  I think the most obvious way to connect them is with a pid= field in the CONTAINER_ID record.

Using a "pid=" field as a way to link CONTAINER_ID records to other
records raises a few questions.  What happens if/when we need to
represent those PIDs in the context of a namespace?  Are we ever going
to need to link to records which don't have a "pid=" field?  I haven't
done the homework to know if either of these are a concern right now,
but I worry that this might become a problem in the future.

The idea of using something like "item=" is interesting.  As you
mention, the "item=" field does present some overlap problems with the
PATH record, but perhaps we can do something similar.  What if we
added a "record=" (or similar, I'm not worried about names at this
point) to each record, reset to 0/1 at the start of each event, and
when we needed to link records somehow we could add a "related=1,..,N"
field.  This would potentially be useful beyond just the audit
container ID work.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

