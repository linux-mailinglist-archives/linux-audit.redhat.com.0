Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B84D3660
	for <lists+linux-audit@lfdr.de>; Fri, 11 Oct 2019 02:40:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34922307D90E;
	Fri, 11 Oct 2019 00:40:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13E5E643C1;
	Fri, 11 Oct 2019 00:40:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB5D8180085A;
	Fri, 11 Oct 2019 00:40:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9B0eq41029147 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 10 Oct 2019 20:40:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 741F6643D7; Fri, 11 Oct 2019 00:40:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EC83643D6
	for <linux-audit@redhat.com>; Fri, 11 Oct 2019 00:40:50 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 229BAC057E9A
	for <linux-audit@redhat.com>; Fri, 11 Oct 2019 00:40:49 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id 7so8043443ljw.7
	for <linux-audit@redhat.com>; Thu, 10 Oct 2019 17:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=H2FS1xOZd/52wDxpWUrAmpLbVkhqrk6X7y4KWQdphOQ=;
	b=excfJ/xPWZ2+jilbteJY4Vi+c9HHFbmh8FkB0VkVQqsRNzfaN29He3nWLonU+RXfhK
	3pXMA0TLVwHppNQr0AUdUG53U42HF+9GxxpGlj/4kcIRtN2pAGAhjypJkZNwf6iE4U2K
	QnDU6KwbkTBSAhWjCsQuxo6Yvo3mAnUXyeDgSEkA6Cy+jFD7qJ0JXa3ufc+Z8Ubil/UN
	0Cdjgen9Fv8pItZNyHwfvmTyOXAjZeb7m1pS8EB6mZ+mIjfO5jq4nE77VYMmJNXOtxB7
	kvPLp8grvYwauQ5k1eqQDdg2eooaCdMYqVLWUpqPOHk/o0cD7moYJjQphs+tsLLeny72
	W+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=H2FS1xOZd/52wDxpWUrAmpLbVkhqrk6X7y4KWQdphOQ=;
	b=X/KkFjn0IQJgzIdb7DtzTeT/91MfGj3d+5AZnluP1MlSovh7VQafO6iqNq5yV5Dw6e
	JD5UNDG1z03AyRYV1C4etQhJyHFUvP8b0iEerwMFzD3NRtz4PZG5i1+4iIsV4Vsy6OQb
	TPJ9lss9jgISmhPvW9mFIiOAEm+fvnuwKp/M9z+RBvai4Wh//LiszXQHtnBm9b8Gq46b
	Flu7csQlXCFwclRYmCDXfSBBi9QHQXl0nRgVPN55o+XexvAHSePzoypoK6KRzE1nbta4
	toz4AIKt4u9U6FEO6wKXGtZziqadFH3IhqvTuNgpEpZDZRVhibT5grKcqDgGfh8Dh7cq
	pqCA==
X-Gm-Message-State: APjAAAXjsCSDRWVvenSDF8Pna5m7b1Il+7jcfuM3FUyqLzBPYIQWi8qP
	cASYI4E5t6AeqsdIxGFCR0oSPe4H8HY4/DhJOzW4
X-Google-Smtp-Source: APXvYqxJgQInWarY5/M7kUO7HpwvMg1Nlpj/lgKKRdJtv+USUKJpyXPsrOQoku+hafT+CZ2zq5wB40bIA3VRiBrUbu8=
X-Received: by 2002:a2e:8ec2:: with SMTP id e2mr7129095ljl.126.1570754447449; 
	Thu, 10 Oct 2019 17:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568834524.git.rgb@redhat.com>
	<ea4e8352fd1671f91d1b015a15abee785ea17136.1568834525.git.rgb@redhat.com>
In-Reply-To: <ea4e8352fd1671f91d1b015a15abee785ea17136.1568834525.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 10 Oct 2019 20:40:36 -0400
Message-ID: <CAHC9VhRUmHiuRH6xYZo36hoV34ouNv4Ny0sWZYcz2dnEhx9nsA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V7 16/21] audit: add support for contid set/get by
	netlink
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 11 Oct 2019 00:40:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Fri, 11 Oct 2019 00:40:49 +0000 (UTC) for IP:'209.85.208.196'
	DOMAIN:'mail-lj1-f196.google.com'
	HELO:'mail-lj1-f196.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.196 mail-lj1-f196.google.com 209.85.208.196
	mail-lj1-f196.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Fri, 11 Oct 2019 00:40:56 +0000 (UTC)

On Wed, Sep 18, 2019 at 9:26 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> Add the ability to get and set the audit container identifier using an
> audit netlink message using message types AUDIT_SET_CONTID 1023 and
> AUDIT_GET_CONTID 1022 in addition to using the proc filesystem.  The
> message format includes the data structure:
>
> struct audit_contid_status {
>        pid_t   pid;
>        u64     id;
> };
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  include/uapi/linux/audit.h |  2 ++
>  kernel/audit.c             | 40 ++++++++++++++++++++++++++++++++++++++++
>  kernel/audit.h             |  5 +++++
>  3 files changed, 47 insertions(+)

I'm not a fan of having multiple interfaces to do one thing if it can
be avoided.  Presumably the argument for the netlink API is the
container folks don't want to have to mount /proc inside containers
which are going to host nested orchestrators?  Can you reasonably run
a fully fledged orchestrator without a valid /proc?

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
