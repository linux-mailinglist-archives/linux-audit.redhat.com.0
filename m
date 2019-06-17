Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 382AB494BA
	for <lists+linux-audit@lfdr.de>; Tue, 18 Jun 2019 00:05:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2EB45B2DD2;
	Mon, 17 Jun 2019 22:04:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2C1A6606C;
	Mon, 17 Jun 2019 22:04:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DDE218363C1;
	Mon, 17 Jun 2019 22:03:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5HM2HSn006334 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 17 Jun 2019 18:02:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5C6A65E7C6; Mon, 17 Jun 2019 22:02:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5663076171
	for <linux-audit@redhat.com>; Mon, 17 Jun 2019 22:02:15 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4DDD5B2DE8
	for <linux-audit@redhat.com>; Mon, 17 Jun 2019 22:01:51 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id i21so10911170ljj.3
	for <linux-audit@redhat.com>; Mon, 17 Jun 2019 15:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HsWdsGdHcCmWS5nc++DZu7iYbolrJmLe83td+Ig9vaE=;
	b=yuWRKTDlK+XqWjq7QVlSItRs/dXUKXy1A8l3JjvZDzMpjItd4K3XndJGD4EYZk89dH
	ftrGFYjxe/x+W0J4EENOQisBCGxAwZ74knvZTRRAdc95RzUE9ZqN7rle2lcHExq1+7+d
	KNKVUjO1/Tq7NCsuoyRpvvkXWShHtHahsZfcDYzKLOg/fIryjzvvFvVDPfhLU3/5KH1y
	5XpSd5sD9vfVqdAAPfRO+haO4Iyy2q/gOCkrVTjDr6Dwp+wLbDg3Ed7Ml30TrT1443Pg
	n+L8c/D2Ni7oRRnHXfPjEJBiwUCTC5tLd2F6dwMPu0LhLviEmx1CX74t2z/9l/sAASI7
	WMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HsWdsGdHcCmWS5nc++DZu7iYbolrJmLe83td+Ig9vaE=;
	b=Hl9sIHRbcsLYF9MnVYJtU5w3P/3lJz1uvL9diNI3ogHHL4dHvV/p0Gx1KY/gEb9ydV
	R4VUjC15USnxW7cEydZH5RQbbI1aK2nCk0lKWVULPUflgDs6JAGItkPthhaWorIqmCl0
	FTuR1Vd0veEPNqbkYMxKCbIeUseEJ34E9M9aEH7vsewC2d8V1M24cfGyiakqEb2k8BWx
	L9EOCGUdV/bzOHQZbToTMBzagAkbSKdLAaWm7189pyyfLm4R0QAyW2OHtg8t5nAROtk/
	n1nc6ypqQ9hZUJDKO4uS48FFuOkbE+4Bu8kAYPEHCnjcRn0TAcwPPYzORh4wDuYGHLbS
	BltA==
X-Gm-Message-State: APjAAAVFtUd1/LKpWvjxllLVlrjwv0x1ADZhL8Avb7SjNYl5axw9IRT6
	RwHk/jVfx7vqdYvhl5suumUZlbxTPCD2XnM68EOw
X-Google-Smtp-Source: APXvYqxO80PFS2J7nH7z2/60Uxxt+c0vds1wc/30QCv3aD8rM/v8/T8bRZyfd3RubIYEKJbFyWNOStsHG2Y6SBEYbYI=
X-Received: by 2002:a2e:9dc1:: with SMTP id x1mr617238ljj.0.1560808909485;
	Mon, 17 Jun 2019 15:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <53af233d05da5e07d75d122878387288a10276df.1560447640.git.rgb@redhat.com>
In-Reply-To: <53af233d05da5e07d75d122878387288a10276df.1560447640.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 17 Jun 2019 18:01:38 -0400
Message-ID: <CAHC9VhQ5xgV2hnegThALdCP8KcqTLZsf2w6h2aT1WnH=-AdtEA@mail.gmail.com>
Subject: Re: [PATCH ghak57 V1] selinux: format all invalid context as untrusted
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 17 Jun 2019 22:01:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Mon, 17 Jun 2019 22:01:51 +0000 (UTC) for IP:'209.85.208.196'
	DOMAIN:'mail-lj1-f196.google.com'
	HELO:'mail-lj1-f196.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.191  (DKIM_INVALID, DKIM_SIGNED, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.196 mail-lj1-f196.google.com 209.85.208.196
	mail-lj1-f196.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: SElinux list <selinux@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 17 Jun 2019 22:05:18 +0000 (UTC)

On Thu, Jun 13, 2019 at 2:43 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> All instances of one field type should be encoded in the same way.
> Since some invalid_context fields can contain untrusted strings, encode
> all instances of this field the same way.
>
> Please see github issue
> https://github.com/linux-audit/audit-kernel/issues/57

It would be good to see a list of all the places we are using the
"invalid_context" field and some discussion about if those labels are
really "trusted" or "untrusted".  In both the
compute_sid_handle_invalid_context() and security_sid_mls_copy() cases
below it would appear that the labels can be considered "trusted",
even if they are invalid.  I understand your concern about logging
consistency with the "invalid_context" field, but without some further
discussion it is hard to accept this patch as-is.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
