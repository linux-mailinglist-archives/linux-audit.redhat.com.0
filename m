Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0A82AA1C4
	for <lists+linux-audit@lfdr.de>; Sat,  7 Nov 2020 01:21:25 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-exUCazjbPS-7tso6sT7_Uw-1; Fri, 06 Nov 2020 19:21:22 -0500
X-MC-Unique: exUCazjbPS-7tso6sT7_Uw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0FA0186DD21;
	Sat,  7 Nov 2020 00:21:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFFC51002C25;
	Sat,  7 Nov 2020 00:21:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 812D2181A06B;
	Sat,  7 Nov 2020 00:21:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A70Krkv030862 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 6 Nov 2020 19:20:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A9B8D215670A; Sat,  7 Nov 2020 00:20:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A449C2166B28
	for <linux-audit@redhat.com>; Sat,  7 Nov 2020 00:20:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D645858280
	for <linux-audit@redhat.com>; Sat,  7 Nov 2020 00:20:51 +0000 (UTC)
Received: from sonic317-39.consmr.mail.ne1.yahoo.com
	(sonic317-39.consmr.mail.ne1.yahoo.com [66.163.184.50]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-458-oCWD-QxvO4iHWjErxEiyyw-1;
	Fri, 06 Nov 2020 19:20:49 -0500
X-MC-Unique: oCWD-QxvO4iHWjErxEiyyw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1604708448; bh=Q3eO4F0+6Df77idtdx7He1NCEibMmDaZoV4ndY6Nnty=;
	h=Subject:To:From:Date;
	b=ZSijOY3H+LIWKBtRCDqXQ3eTgYjkES83hBaeYbvE7kSoEjPiSDPx2iittGVGGTYoJHPXsVzrVjoIqo1JkCI8C4q/qz69i8RyFhKpzZk/lAKoQtzCTbHZIbKvyYcEPwj4BRSzQ1dxvUnhvfxY15A0qFsYgQPEKG6PuAHqFcjKLbzeSpOykOM2nQP6Mm24mtxIA8Zfu9lU9cUrwSQlOkxKwZ98jqlk2IBIPyz6G3CTahF09FJKQes8kBu0IfhhAMxDACTAuythUrzs69L2sLBL6zPFVUqQH5JPCBYDNHa16OWIqr+hrI8uQQfDArSruSQHuPR2qONW3QgXH2Lwz3wArg==
X-YMail-OSG: KhRms4kVM1l.WnJPcrMQ6zb0vrLwRIxCOsI7MFZ_a1KP.jp8QWGCy7Laj5HIwPv
	TQx3K2MPBNoDKcyb3vLqQFLFPDZ_A30YM3H1kW_r9wluG12nY.Tls6pn6zfP18p2yePhkYjX7jUh
	bKMwm91vrgQjJCk05igB7AB6sJs8c2Lmu8ddg_Q5OPHB2Cw7g3BXx6X86n7wBssHxCObf3Bg39Qm
	rAxd4eaMmtYZpXm2EMurR2RgJ4ZBIMj5g0Sfm5J342244GV.8Hwrn2WTWvELp44hal14WefJMdhF
	yFY6b4HwkeU5yGfeKTHalcQrJ_UxKgutHQXfwJyYZrYURtcDLB0fT5pXnYErLMycX6Ufmb4lKePl
	DzSk2cOheveQkfVEU7i6TSRY9pYr1AAf4Ia0cA5ckSaUR650zKfYK_Cn4k_jva6TEs.xFEj457Ta
	G3Ijzf043DtP9Pr_hxVTbUgQox3nlbQBNQLc6Em6vrzMtkeoP7uDE0V5K4vvfrcRKz3E.zUEWwEZ
	givbpyLjQjXHXiLEGxPxqG0AFHtB5X_ym4XJYWp8Xczxox2FG3jp2KRfPHzVSfMuDNxalGPlj5KB
	Hw4W2G6nH9vQlka0W0fHRFhsJIg3DTOiZ2NuOOtVQASf1VCx0U986tlxFAHAKBXyd_HMjP6uB652
	7vdFIYIj39hfqxmjw_KiYfKwEV2YrVK5Abv5AshaUp_a9cGsUVsmkd6AzhCHw54.P.oms4hqPImf
	H.NiXBjgvFlyJn_r9nKBGAPIEp4XqPYzvyc2eDVdbxUheWg7xNyNweCFNDlsLv_qzsm5joAJrvcI
	uLkPxSz_afGEAXk2fqJG6c4CXHUxiOvnrDqjtGtJKmlvViuKnV3oNKytGA.pW.MEWIc5bzWLfqru
	hJxqo6Tk3bXrVy8056Pyi0N37y1dWEL65HcHJqtsgE1uEt04nb7JEZV15GulFsUpJarU37M46RKe
	tw0FUKAfWJEABKVEZytDG9YRZ.L2FIXQynqSxM3HL9jbtGauwjIHiE1EiRI5MAc_RK464qqhOuKQ
	ii_1euYYzrWcbuFO77ZNBSZEo9Zzf7YaYLv5Z1sfWU3fM.FqBMk1FCake1VhIbZ5RCABoTX2I_7Q
	aFPvGemEFXd8gxmWeJmPHV84cpClpBb36aLK5uWCI5hPbS4Tv0.wXSPDxJkFQrlhGE5YCOE0yLdk
	ZvVWaNGLR7FSt7hhMgrhrXbmn_YYOQVzy0_drEdn9Jeuz4sX2SXZaSSrSKygkwE1OWzaA4RL9XfM
	HGJ1M8xBdjcZTgsi5fW3AoTMu9v0WJtlGvcHWJWDshhZG6.JVthQ0gfhe9F3WbOfR9JAxHnlP.68
	G_ZSlunrTkSZAaTZ7vZTW8A15X.xG9W8fTpQkOIHFHQBPqxr6n_pt7XaNLLR0Dr81NNY8hrDRMcj
	z0JSl00rhGmaUiCzk.OE44jzHPaXg31o144f6KhfKWQ0sNkZq1U6Y1rE8eAUjN8h7ykm83USuJr_
	xPBaxZ70VwS_5iScjiQOBM2p2W3IrSV3F1HFHeTLEAIXPXmJGU34xybkwagaRjX6ghXxnCYrUVHS
	dnHqkc2b5iOvxkfm0bNMeP1VuVqO16yWDdVJEqcR1tn2bCLqC6fMI5UO1LCwUycRo24xo2eHjHNM
	N0j5n8kNHIdTZQJogZVdA5MXjuVqM_eaTl6jiv55lEkm6jzzpqWyuTm3ztijoGvTYPAjSfbRRCpp
	TL2MJf1tkS_rTFCmI4zIAGHlTtGvxRfyVe08W9lap7YOonyCFEd_r5BFrTp4pC3seEUrdtCsHcSj
	50KoLa_ik9WOYEwee3SaxDKJKBqy3SWBoizJVAwFBE422bBV.zR8.X5UrL6zK9cbVN5idTzLHCoq
	FG26Llj5O_DdLdZ.tk7UbwIqHGr3MllU8ZOkl0rZcAP1p0if8tRb_EC4qikdoklBGbITEmnmvm3A
	mba82c7LKksXc8uFPuFpOumNor0f8woMC1vdQ_OcBnc9WBvlNHN208hyBbuJpiZ81hJWxxEwsnnE
	h2p0C5I8ZRnUQrc7VEumlW0QkDBufupAITn4Vs5OGrHO73afBxKNQle2Z9MIQ2JNiV9SaiRnWVPz
	.7Xn7bVHmdsosUR0Wxy5RrscXA_381QktmdLq572OFGqRIc4JrNQiRnWLK3IVG3mi.zam.NCHnAZ
	pmtAEAXN61GdrfZSSnn2eMDqDnJNh1L87njeQgAdn8B347EFDivjXdFkfFCKRwMmdWj.GR637S5K
	RZLA3kxqnkn9Wv1B26i_ZsEkft68f1F6Vok6u4vFb6shW0G6S7z_43H6qi6WK5oDpvfb8BtJOtFx
	7iSGDINxhxKexts63gcbntib0pqkLfpw5uUFDGKON38hMs.iSTUNmShY_AD6xSNoaYtclWvaMoUx
	bNVM7nGjZ5w15MKr_RUzpuf3HgEqn6Nhsn1YddVAMtJyfR9nRdT8t1nlSKmb3cPCZOX5ZbhqQuNl
	LxlTdnu7SY5LsxfZ1rOuoOBEv40EC9vXkFjEVgamLmspTzY9dn4zjZUG9b5bQBiIVy4v2VRwhotP
	j5PZswuOOrbDo0WbKDqkNQes1V2293Nmp61SinbbvQAz7.CXasuL5_L9Ark1TEhFRjeB5w3zzgn.
	lOavbh84rID7PkYkofQ5F_iJOm3TDslGQSZTrG437dSTNXfKOVKvLQdPVkeaJFJUjMsOmeCRMTG5
	7QG.mmHNyBeXmAAGCg1okvrd6VlSwPBIm9DLeFQ_eo.G3vkpnXXKhNLHaZ864EqeDFMRZFZlwOy6
	TWppgmqlvtXQkTzDemHBU4bhReEFgki8E_c3zClF7c4ykLkBiPsvnX__Kwa3Kquvhpvy1_nicEhZ
	q0uNrgcUBqaYLKPNrQDasZutKVmEmktL1zsexGMgwzRHlCWyS_.__6SBvVuH5hMNFJoOdxeKC61a
	2uQ.AUHR399MZMN9c53m9vXEoDbF8AdJOtSMf0qdNFLaX_YsB8R04HlpUvsEkGbxe3a9kdB_8EJd
	h8SSMuQ6A3gVzM0.EOtW02J6Hh6XgMR85kOxwNQUEcqa6M2eI1f7PdVEuzvks2Aq9K5ocsZmzkdu
	jLDThHV_jKJqDPwSnU2bmyJ8rzgSgh.go1JS_ML3puATlrV36Y.3hjNjfFN696YfPU5WtG_yZdNg
	mEhkhkYIlmxfLaSahRefzy.G2UTaF1m.L5_dOWWpUutkkLUudoKXNgD_2JhQLxqccpo10oN6R0HJ
	592f2iDdl3.DZkWMmTo.b7tiUhROOKyf.vuHg2j7vv_3.DkqQi.yWevrUZZuNoQoJKbxsW5sZclW
	XV1En6wsAGJERrWkOVvyMGQ._h2Xbo.sWzaTk0fuuzR7LGvWK23yz54Qy2lDmt1Z72e2mzmNm.qw
	SuGMR27lhfSx3iu0nb4XaB.sBQgTg_0JhRajt5ZJJfmoxZBuSM3pMLc_eQB4TigcOANX9BdKQHj5
	zzefCZgqP0Zc.nB4RhMsU855cJxCJUP6gFICrW6wfLkYRUmCL3M.bxCHkllChKL0hw9nzXm2kPV.
	EOdyNu0NEN6uIOVaw2k6.Mb2xgVag4BwawyQwwcSXgnQRb7tnobLtdu5G1ePb1.b2zya9ur7i2rq
	90AegAJ1tessa7g--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic317.consmr.mail.ne1.yahoo.com with HTTP;
	Sat, 7 Nov 2020 00:20:48 +0000
Received: by smtp412.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID a2775549ebdce05967a3db044c741a58; 
	Sat, 07 Nov 2020 00:20:44 +0000 (UTC)
Subject: Re: [PATCH v22 12/23] LSM: Specify which LSM to display
To: Greg KH <gregkh@linuxfoundation.org>
References: <20201104234114.11346-1-casey@schaufler-ca.com>
	<20201104234114.11346-13-casey@schaufler-ca.com>
	<20201105092245.GB3439341@kroah.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <31027d8e-50bc-70be-b4f2-a96a84de2bae@schaufler-ca.com>
Date: Fri, 6 Nov 2020 16:20:43 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201105092245.GB3439341@kroah.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, selinux@vger.kernel.org,
	linux-api@vger.kernel.org, jmorris@namei.org, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	casey.schaufler@intel.com, sds@tycho.nsa.gov
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/5/2020 1:22 AM, Greg KH wrote:
> On Wed, Nov 04, 2020 at 03:41:03PM -0800, Casey Schaufler wrote:
>> Create a new entry "display" in the procfs attr directory for
>> controlling which LSM security information is displayed for a
>> process. A process can only read or write its own display value.
>>
>> The name of an active LSM that supplies hooks for
>> human readable data may be written to "display" to set the
>> value. The name of the LSM currently in use can be read from
>> "display". At this point there can only be one LSM capable
>> of display active. A helper function lsm_task_display() is
>> provided to get the display slot for a task_struct.
>>
>> Setting the "display" requires that all security modules using
>> setprocattr hooks allow the action. Each security module is
>> responsible for defining its policy.
>>
>> AppArmor hook provided by John Johansen <john.johansen@canonical.com>
>> SELinux hook provided by Stephen Smalley <sds@tycho.nsa.gov>
>>
>> Reviewed-by: Kees Cook <keescook@chromium.org>
>> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
>> Acked-by: Paul Moore <paul@paul-moore.com>
>> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
>> Cc: linux-api@vger.kernel.org
>> ---
>>  fs/proc/base.c                       |   1 +
>>  include/linux/lsm_hooks.h            |  17 +++
>>  security/apparmor/include/apparmor.h |   3 +-
>>  security/apparmor/lsm.c              |  32 +++++
>>  security/security.c                  | 169 ++++++++++++++++++++++++---
>>  security/selinux/hooks.c             |  11 ++
>>  security/selinux/include/classmap.h  |   2 +-
>>  security/smack/smack_lsm.c           |   7 ++
>>  8 files changed, 223 insertions(+), 19 deletions(-)
>>
>> diff --git a/fs/proc/base.c b/fs/proc/base.c
>> index 0f707003dda5..7432f24f0132 100644
>> --- a/fs/proc/base.c
>> +++ b/fs/proc/base.c
>> @@ -2806,6 +2806,7 @@ static const struct pid_entry attr_dir_stuff[] = {
>>  	ATTR(NULL, "fscreate",		0666),
>>  	ATTR(NULL, "keycreate",		0666),
>>  	ATTR(NULL, "sockcreate",	0666),
>> +	ATTR(NULL, "display",		0666),
> That's a vague name, any chance it can be more descriptive?

Sure. How about lsm_display, or display_lsm? I wouldn't say that
any of the files in /proc/*/attr have especially descriptive names,
but that's hardly an excuse.

> And where is the Documentation/ABI/ entries for all of this, how does
> userspace know what these things are, and how to use them?

I'll add ABI descriptions and move some of the lsm.rst up from where it
is later in the patchset.

>
> thanks,
>
> greg k-h

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

