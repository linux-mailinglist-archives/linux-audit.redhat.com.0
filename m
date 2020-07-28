Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id F41E522FF65
	for <lists+linux-audit@lfdr.de>; Tue, 28 Jul 2020 04:15:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-FeAxXVuLOBaND7oca21-IA-1; Mon, 27 Jul 2020 22:15:05 -0400
X-MC-Unique: FeAxXVuLOBaND7oca21-IA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA36B106B246;
	Tue, 28 Jul 2020 02:14:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB81F5F1EA;
	Tue, 28 Jul 2020 02:14:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4598E95489;
	Tue, 28 Jul 2020 02:14:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06S2Ej8U005207 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 27 Jul 2020 22:14:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2DAEA2166BA4; Tue, 28 Jul 2020 02:14:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27A9C2166BA2
	for <linux-audit@redhat.com>; Tue, 28 Jul 2020 02:14:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD874924900
	for <linux-audit@redhat.com>; Tue, 28 Jul 2020 02:14:41 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-317-YBIT2uNFP1C5eETYo1EO4Q-1; Mon, 27 Jul 2020 22:14:39 -0400
X-MC-Unique: YBIT2uNFP1C5eETYo1EO4Q-1
Received: by mail-ej1-f68.google.com with SMTP id g11so7284183ejr.0
	for <linux-audit@redhat.com>; Mon, 27 Jul 2020 19:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ntpZED/bDicwQAEOYBBXCb0Vf/5An8qRDW4/uB32sUk=;
	b=a0thIuOR/G+ZivDWMcCKZYcW+bK/MPaPNdPk40Yuc8FnYbzcccACBiQ5u5UnA0Lfe/
	H7iitkOdzXDymHUxTRbbf8UOv04DL/xwj3z5izMIl0Rb8iCQ2Kz15V4F2pw4yP+JL9GU
	vS2K1WU9l7whoRWU/t/70+FoJGSS7/kS/XHbpyUYsHPFNvrwD7vE5YW73gbPNRruaitd
	mpSw3LbtM9za3czFfZNadBrL8KGZXqlrsE2dE973N03Mm8EAhBB1yMUyR6zk7o97cApl
	cQ+qHv/brDnMjwzq40g1QGVDb7iZfMrxtBznR1Crii12NmXQZHxU0qQfFSJrx19PkQd8
	sx2g==
X-Gm-Message-State: AOAM531UXCyiFgsP3LerWZLgixruaMiMVnQAhfcuCC85V9Gjsf+yg3R1
	vDmMTLPAtQj+f3DfZ0FCcw8K3IBA2+n8rXGCS1RzvKw=
X-Google-Smtp-Source: ABdhPJwc8DqsJGPgarb7e3Hd57xYvw4BfDWTZIFWsDfO8+3vYv71T/BGXu4iQOxPjuRAY3Ia1prjQmG8/cVecbd70J8=
X-Received: by 2002:a17:906:43c9:: with SMTP id
	j9mr7595815ejn.542.1595902477608; 
	Mon, 27 Jul 2020 19:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <e3e9c9da9115fd233c5a7895dbb4a698a365b1b0.1595884394.git.rgb@redhat.com>
In-Reply-To: <e3e9c9da9115fd233c5a7895dbb4a698a365b1b0.1595884394.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 27 Jul 2020 22:14:26 -0400
Message-ID: <CAHC9VhSx23JiN6GprskxdEcs9uftJOp03Svh7YJbQLOV91AMiQ@mail.gmail.com>
Subject: Re: [PATCH V3fix ghak120] audit: initialize context values in case of
	mandatory events
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: Eric Paris <eparis@parisplace.org>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
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

On Mon, Jul 27, 2020 at 5:30 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Issue ghak120 enabled syscall records to accompany required records when
> no rules are present to trigger the storage of syscall context.  A
> reported issue showed that the cwd was not always initialized.  That
> issue was already resolved ...

Yes and no.  Yes, it appears to be resolved in v5.8-rc1 and above, but
the problematic commit is in v5.7 and I'm not sure backporting the fix
in v5.8-rcX plus this patch is the right thing to do for a released
kernel.  The lowest risk fix for v5.7 at this point is to do a revert;
regardless of what happens with this patch and v5.8-rcX please post a
revert for the audit/stable-5.7 tree as soon as you can.

> ... but a review of all other records that could
> be triggered at the time of a syscall record revealed other potential
> values that could be missing or misleading.  Initialize them.
>
> The fds array is reset to -1 after the first syscall to indicate it
> isn't valid any more, but was never set to -1 when the context was
> allocated to indicate it wasn't yet valid.
>
> The audit_inode* functions can be called without going through
> getname_flags() or getname_kernel() that sets audit_names and cwd, so
> set the cwd if it has not already been done so due to audit_names being
> valid.
>
> The LSM dump_common_audit_data() LSM_AUDIT_DATA_NET:AF_UNIX case was
> missed with the ghak96 patch, so add that case here.
>
> Please see issue https://github.com/linux-audit/audit-kernel/issues/120
> Please see issue https://github.com/linux-audit/audit-kernel/issues/96
> Passes audit-testsuite.
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  kernel/auditsc.c     | 3 +++
>  security/lsm_audit.c | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 6884b50069d1..2f97618e6a34 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -929,6 +929,7 @@ static inline struct audit_context *audit_alloc_context(enum audit_state state)
>         context->prio = state == AUDIT_RECORD_CONTEXT ? ~0ULL : 0;
>         INIT_LIST_HEAD(&context->killed_trees);
>         INIT_LIST_HEAD(&context->names_list);
> +       context->fds[0] = -1;
>         return context;
>  }
>
> @@ -2076,6 +2077,7 @@ void __audit_inode(struct filename *name, const struct dentry *dentry,
>         }
>         handle_path(dentry);
>         audit_copy_inode(n, dentry, inode, flags & AUDIT_INODE_NOEVAL);
> +       _audit_getcwd(context);
>  }
>
>  void __audit_file(const struct file *file)
> @@ -2194,6 +2196,7 @@ void __audit_inode_child(struct inode *parent,
>                 audit_copy_inode(found_child, dentry, inode, 0);
>         else
>                 found_child->ino = AUDIT_INO_UNSET;
> +       _audit_getcwd(context);
>  }
>  EXPORT_SYMBOL_GPL(__audit_inode_child);
>
> diff --git a/security/lsm_audit.c b/security/lsm_audit.c
> index 53d0d183db8f..e93077612246 100644
> --- a/security/lsm_audit.c
> +++ b/security/lsm_audit.c
> @@ -369,6 +369,7 @@ static void dump_common_audit_data(struct audit_buffer *ab,
>                                         audit_log_untrustedstring(ab, p);
>                                 else
>                                         audit_log_n_hex(ab, p, len);
> +                               audit_getcwd();
>                                 break;
>                         }
>                 }

I understand the "fds[0] = -1" fix in audit_alloc_context()
(ironically, the kzalloc() which is supposed to help with cases like
this, hurts us with this particular field), but I'm still not quite
seeing why we need to sprinkle audit_getcwd() calls everywhere to fix
this bug (this seems more like a feature add than a bigfix).  Yes,
they may fix the problem but it seems like simply adding a
context->pwd test in audit_log_name() similar to what we do in
audit_log_exit() is the correct fix.

We are currently at -rc7 and this really needs to land before v5.8 is
released, presumably this weekend; this means a small and limited bug
fix patch is what is needed.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

