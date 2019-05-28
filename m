Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C502D14C
	for <lists+linux-audit@lfdr.de>; Wed, 29 May 2019 00:01:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4DE72307D980;
	Tue, 28 May 2019 22:01:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BC4A611B4;
	Tue, 28 May 2019 22:01:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AAF108E1F;
	Tue, 28 May 2019 22:00:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4SM0ZJZ027414 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 28 May 2019 18:00:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 33D005DA64; Tue, 28 May 2019 22:00:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D1565DAAC
	for <linux-audit@redhat.com>; Tue, 28 May 2019 22:00:32 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5920813AA9
	for <linux-audit@redhat.com>; Tue, 28 May 2019 22:00:22 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id r76so360527lja.12
	for <linux-audit@redhat.com>; Tue, 28 May 2019 15:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EHvn4s69qRAkqCTZkEehi/H5Z5XVFlbsc9LilZ/6rhU=;
	b=d/MWchBiirBMVtTeRskX8L6oPR1CeFqNO7VooayF2BJ6n13nwtHUzq5Obq75E+fyxB
	uCRHkGs62PYMz1JChPDMx9vNCYF415K06h8uorR2kniCP6BHO6vF9PK7Xf52kwiyLk8w
	uTVEG4P5HfF/WAt/DHV5sZdlI0Jodq8MkRhO1/vqeFQlvc1sq/D8Ff7GXk4OK9VuHKln
	1R+ALu05BTDlbL46BYawYmfDItHpzp3iimxWJm41cGwfUTf+r24DNjSLSddxDHw21PXp
	SCEX5APUPdm+TA/LvAaY6HQaXML9kCSn+rYiP9m2XIBZo/4xEJJTSO1B0CJfPw51Hax1
	VMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EHvn4s69qRAkqCTZkEehi/H5Z5XVFlbsc9LilZ/6rhU=;
	b=HvosFvaqMbnSlCpj0WweBSabQdQTrxo2TVfNpywr0v40rcaMa4GvYpcMndqcPYrz/U
	4OVhIyNbddUM2v81SkAAWPEzGM6qfESxWXlxqBKW16trTGFMIIPMTHS2seZQww2slZMl
	dIrCtZ8lHFcx7utljAkr+8wADPAQiSxrlwLAK3OlBKITJWf0IOV0oMCXrAM+qUjfKQ+Z
	7Q5syZEXuA6v3bzZmO6VFYht1iKdnotbxoU7rRpc8wMD3QrXbIk7pp/a6lLRexnGJA9f
	aFmAMhJQX2lbesWa9DIPRxX/hVhFPaIhKKYXtjsPsKrqx1qHnDO/cH1drr6t3Yu1riuD
	kiUg==
X-Gm-Message-State: APjAAAULlUohcZYhDxPB1jkpv3x7+S83weM4daaWZtIp2Wl51YO7OQfH
	pZhgykWwv3YCDoWZ5RY+u6FnyYajvlAjhjDYzUkX
X-Google-Smtp-Source: APXvYqy04rKV1U36mNJMmWrFPLZ9pMB8X6OzjdwZQjKv2SElMStgcdv7F2HUSsDrEB4OPGkXzWyaatj6OeVKneCxI1o=
X-Received: by 2002:a2e:9b46:: with SMTP id o6mr28943523ljj.76.1559080819869; 
	Tue, 28 May 2019 15:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <2fd85f3efc5a8816483497a84c1e031ee56d4ebf.1558553100.git.rgb@redhat.com>
In-Reply-To: <2fd85f3efc5a8816483497a84c1e031ee56d4ebf.1558553100.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 May 2019 18:00:08 -0400
Message-ID: <CAHC9VhQ09UQV+mg4HRhMuWFV+7sX_XqhwPMpfO2oUTSD4Bup+A@mail.gmail.com>
Subject: Re: [PATCH ghak114 V1] audit: enforce op for string fields
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 28 May 2019 22:00:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Tue, 28 May 2019 22:00:22 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com'
	HELO:'mail-lj1-f193.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.306  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.208.193 mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>,
	Eric Paris <eparis@parisplace.org>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Tue, 28 May 2019 22:01:12 +0000 (UTC)

On Wed, May 22, 2019 at 5:52 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> The field operator is ignored on several string fields.  WATCH, DIR,
> PERM and FILETYPE field operators are completely ignored and meaningless
> since the op is not referenced in audit_filter_rules().  Range and
> bitwise operators are already addressed in ghak73.
>
> Honour the operator for WATCH, DIR, PERM, FILETYPE fields as is done in
> the EXE field.
>
> Please see github issue
> https://github.com/linux-audit/audit-kernel/issues/114
> ---
>  kernel/auditsc.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)

While the patch looks fine, it is missing your sign-off.  If you reply
to this thread with it, I'll go ahead and add to the patch when
merging.

I'm sure everyone is tired of hearing me complain about people not
checking their patches, but this is something that would have been
caught by running ./scripts/checkpatch.pl against your patch (the
entire patch, not just the code portion).  If you aren't running your
full patch through checkpatch already, it is easy to do (there are
likely other ways too, these are just the two that I use):

* using git
# git format-patch --stdout -1 <commit_id> | ./scripts/checkpatch.pl -

* using stgit (my favorite)
# stg export -s <patch> | ./scripts/checkpatch.pl -

> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 30aa07b0115f..087137d341a2 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -601,12 +601,20 @@ static int audit_filter_rules(struct task_struct *tsk,
>                         }
>                         break;
>                 case AUDIT_WATCH:
> -                       if (name)
> -                               result = audit_watch_compare(rule->watch, name->ino, name->dev);
> +                       if (name) {
> +                               result = audit_watch_compare(rule->watch,
> +                                                            name->ino,
> +                                                            name->dev);
> +                               if (f->op == Audit_not_equal)
> +                                       result = !result;
> +                       }
>                         break;
>                 case AUDIT_DIR:
> -                       if (ctx)
> +                       if (ctx) {
>                                 result = match_tree_refs(ctx, rule->tree);
> +                               if (f->op == Audit_not_equal)
> +                                       result = !result;
> +                       }
>                         break;
>                 case AUDIT_LOGINUID:
>                         result = audit_uid_comparator(audit_get_loginuid(tsk),
> @@ -684,9 +692,13 @@ static int audit_filter_rules(struct task_struct *tsk,
>                         break;
>                 case AUDIT_PERM:
>                         result = audit_match_perm(ctx, f->val);
> +                       if (f->op == Audit_not_equal)
> +                               result = !result;
>                         break;
>                 case AUDIT_FILETYPE:
>                         result = audit_match_filetype(ctx, f->val);
> +                       if (f->op == Audit_not_equal)
> +                               result = !result;
>                         break;
>                 case AUDIT_FIELD_COMPARE:
>                         result = audit_field_compare(tsk, cred, f, ctx, name);
> --
> 1.8.3.1

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
