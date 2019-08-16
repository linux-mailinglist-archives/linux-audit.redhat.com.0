Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2DD905C1
	for <lists+linux-audit@lfdr.de>; Fri, 16 Aug 2019 18:29:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7FAA65F5A;
	Fri, 16 Aug 2019 16:29:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9024E3795;
	Fri, 16 Aug 2019 16:29:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C957918005B9;
	Fri, 16 Aug 2019 16:29:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7GGTQtY002816 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 16 Aug 2019 12:29:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 064623842; Fri, 16 Aug 2019 16:29:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 011F0BA59
	for <linux-audit@redhat.com>; Fri, 16 Aug 2019 16:29:22 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B2B081F0C
	for <linux-audit@redhat.com>; Fri, 16 Aug 2019 16:29:21 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id m24so5809285ljg.8
	for <linux-audit@redhat.com>; Fri, 16 Aug 2019 09:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Pb1dJnMcCuUxqNlEH74lTDGdrP8RS3vLcKTgQoY3yZQ=;
	b=FWoV0ATs5FGV4ZBl8oQJ/yknE0+N+PGT7v0iE5Ro42XrtEZle8i+DYwWT/ou09MbhF
	TMShCE9s0yl4vkYMkhVeDsmUQq8hxHyolqQfd9pWEx5FOYhHy8UkMHCbeeMqOc65Cxtg
	+s40PJdTcOz7M2w3cigXXDLvL51ivCvvmKa5ADm9JWhlNA2dZkQudT2f/p8ba7qH1r3F
	dXDc2Gb/H277NFrKD49ECjh49cmWL/lfwZe19yhi9DNKA9KyGLRMwltd9jCNJbv2AdpX
	/sZcC/CVc4Z0yJgRQn2NFNko7Mi/s5jUlWH7GZG8OiuGG2c2gE6gpVh2wnE/tjAAw3/f
	g/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Pb1dJnMcCuUxqNlEH74lTDGdrP8RS3vLcKTgQoY3yZQ=;
	b=AaIpxO7EkhccFc3RJnFoSQNeRfjrEkWatT5O3bqa0bRBTDCYpXDNeJmK5roAf+b3Yz
	KYJmApb8W1C1U+nM3NaUT9n+CR9e00F/+fKrStOKDtdOrDJIPFywD2EYIFLFS+DGzz1E
	4UvN29pH1D7KnaQy2Gz8ejx3rCEicCVB87njyV7+JgxAhV94tIzhQIoXyNsWkmBm9bwW
	iHqawsmcV6/1k4LjJahDyr3Qp3woQ1IlV7tXx3KjKBxGHJXr+1FnmXH6AqUAzu3MQ8xc
	7hvGHfIVJLmOfslFFn5ZuEPPI+YglLeaX/tqu3suucUMv3DWzIPkGaS742u3pvp0gz5O
	SWOA==
X-Gm-Message-State: APjAAAUxBcuxIj56vnFoz9ioZElz2MbmwjPPvzYHImAS87copONVckaN
	jXUYdtFM1BzKNdm+mWbNg4KyFM7L8U6J6xDnJHck
X-Google-Smtp-Source: APXvYqwTo86pc3wtjSRNvwvaVvPzQk1GNxxqKZk/bJrUwU1pnmgHD+hdoXWEmocncfzZBvnR92VFb0IdWgE43DMpiIc=
X-Received: by 2002:a2e:834e:: with SMTP id l14mr6010790ljh.158.1565972959608; 
	Fri, 16 Aug 2019 09:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190801144313.1014-1-acgoide@tycho.nsa.gov>
	<CAHC9VhTSWiz45vh+M+sgu+ePwgFPZ4Mr8GmRZQjsGWQSzkjbLg@mail.gmail.com>
	<b79617aa-2b40-40bf-9f35-0f5be8e34d3f@tycho.nsa.gov>
	<20190813212710.wimxgfunrijqwuqt@madcap2.tricolour.ca>
	<CAHC9VhTWY4vtsmCn8X3TjR1HdsB1-wqBLs03vZVv0SmWQ-Ab2Q@mail.gmail.com>
	<b47e07bc-1b01-c5f0-305d-e6fe014b00d8@tycho.nsa.gov>
	<CAHC9VhRzz52bVwMikM7C65vCCSLb0=y1HtB50o-H0G3AMHqRNw@mail.gmail.com>
	<cb2833ee-3a12-9c7d-6c5b-c7944e74b3e9@tycho.nsa.gov>
In-Reply-To: <cb2833ee-3a12-9c7d-6c5b-c7944e74b3e9@tycho.nsa.gov>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 16 Aug 2019 12:29:08 -0400
Message-ID: <CAHC9VhT-mmTyHij0MJHBWRjf6YmPBX9LHHaZ0H1sWx7v0O8jPw@mail.gmail.com>
Subject: Re: [Non-DoD Source] Re: [RFC PATCH v2] security, capability: pass
	object information to security_capable
To: Aaron Goidel <acgoide@tycho.nsa.gov>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 16 Aug 2019 16:29:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Fri, 16 Aug 2019 16:29:21 +0000 (UTC) for IP:'209.85.208.195'
	DOMAIN:'mail-lj1-f195.google.com'
	HELO:'mail-lj1-f195.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.172  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.195 mail-lj1-f195.google.com 209.85.208.195
	mail-lj1-f195.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: mortonm@chromium.org, john.johansen@canonical.com,
	Richard Guy Briggs <rgb@redhat.com>,
	James Morris <jmorris@namei.org>, luto@amacapital.net,
	selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com, Serge Hallyn <serge@hallyn.com>,
	Stephen Smalley <sds@tycho.nsa.gov>,
	Nicholas Franck <nhfran2@tycho.nsa.gov>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Fri, 16 Aug 2019 16:29:38 +0000 (UTC)

On Thu, Aug 15, 2019 at 9:11 AM Aaron Goidel <acgoide@tycho.nsa.gov> wrote:
> I'm looking at how to enable LSMs to selectively turn on audit
> collection. So there seems to be two key points: audit_alloc() and
> __audit_syscall_entry(). Would it suffice to define a single boolean
> hook that takes the task and call it from both functions, to decide
> whether to override an AUDIT_DISABLED state in audit_alloc() and to
> override a 0 audit_n_rules in __audit_syscall_entry(). In audit_alloc()
> if audit_filter_task() returned AUDIT_DISABLED and the hook returned
> true, we would change the state to AUDIT_BUILD_CONTEXT. In
> __audit_syscall_entry(), if the hook returned true, we would set dummy
> to 0. Obviously, we could have a more general hook which lets us return
> arbitrary audit states, but, it isn't clear how we would reconcile
> conflicting results from audit_filter_task() and the hook for any
> situation other than AUDIT_DISABLED. We could also potentially use a
> different hook in __audit_syscall_entry(), though I don't think that we
> want the LSMs trying to interpret the syscall number or arguments.
>
> Do you think that is sufficiently general or would you suggest something
> different?

FWIW, I think treating the per-task audit switch as a boolean is fine;
I don't think we want other in-kernel callers to have to worry about
the different audit states.  From their perspective it is either "on"
or "off".

However, I think there are two parts of the greater LSM-enables-audit
discussion, and we're only discussing the first part: collection.  The
second part is the actual audit record generation, and I think this
part is going to be less clear.  While the changes to audit_alloc(),
etc. are necessary to be able to do any meaningful audit later on, I'm
thinking introducing some granularity and LSM control to what gets
generated in audit_log_exit() might be very welcome both from a
performance and log cleanliness perspective.

Some random thoughts on this (some may be way off, but I want to start
with some expectations):
* The LSM should never be able to block collection/generation of audit
records, just enable additional records.
* The LSM controls should only affect what we call the "syscall
auditing" bits, e.g. the stuff in auditsc.c.  Audit records that
happen outside of this should be untouched, the AVC records are an
example of a record that exists independent of syscall auditing.
* We should be able to have the LSM set a per-syscall audit enable
flag which would be checked in audit_log_exit() (or
audit_free()/__audit_syscall_exit()).
* It's not clear to me if we want to provide some granularity to the
LSM regarding what records get generated in audit_log_exit(), for
example do we allow the LSM to request just PATH records?  I'm
guessing we wouldn't want to specify record types directly, but
perhaps record "classes", e.g. "file".

I'm not sure if any of this is going to be a good idea, but I think we
need to discuss it a bit before we start duplicating things in
lsm_audit.c.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
