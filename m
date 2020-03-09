Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 43CE817ECF4
	for <lists+linux-audit@lfdr.de>; Tue, 10 Mar 2020 00:59:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583798344;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=OpmZi0O76hYsKUmEUgOcCFmOg/eVkjLhUq/GRymLrCw=;
	b=NsruG42/xujFCeKtR8OCX8Es16Pji7YGqmjedzb8WppkhkZxrkGKbOJ5BTUHdmegA2LqBs
	JWKyrBNRnXAzHHWvhmbJfFuPfCT8LiGkAGYeLAaXSONPOQAZkTcOyUEMj1r4S5WyYcHg5n
	a48EmMhRRpTCzZT/nBbFLLJkwbkjt7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-o115RsHuNdOmYhqDTCreYw-1; Mon, 09 Mar 2020 19:59:01 -0400
X-MC-Unique: o115RsHuNdOmYhqDTCreYw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D070013F7;
	Mon,  9 Mar 2020 23:58:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A47518F351;
	Mon,  9 Mar 2020 23:58:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1787818089C8;
	Mon,  9 Mar 2020 23:58:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 029NwjuJ001873 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 9 Mar 2020 19:58:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1DB2F2028CD2; Mon,  9 Mar 2020 23:58:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 187032026D67
	for <linux-audit@redhat.com>; Mon,  9 Mar 2020 23:58:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B3118007AC
	for <linux-audit@redhat.com>; Mon,  9 Mar 2020 23:58:43 +0000 (UTC)
Received: from sonic309-27.consmr.mail.ne1.yahoo.com
	(sonic309-27.consmr.mail.ne1.yahoo.com [66.163.184.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-437-ALZQrv1YPfGUheflSbxI6Q-1;
	Mon, 09 Mar 2020 19:58:40 -0400
X-MC-Unique: ALZQrv1YPfGUheflSbxI6Q-1
X-YMail-OSG: hr6BUJwVM1lnn7JDVHb6e4HKlZHqLQa2peWyZw6OGEoKeMriTLxFFkpBjqs2Egb
	xLMPMbAoRR8xSQG6TemlDjvFg8duAiMrLeFRT9MGPWrpXqHS_DQv3mHQ91R8LwOE7Sb1uTQuNMJk
	u30DqAakRr_Bo7__MmVt.TMiYOHXVieplGq_bwBy_XMFGEwJ7G3aDHcmqKPSNZ7sAedFQImVETSj
	dAccATqX1HDZfGRp2C7lp5sSG4G8FAgu85O8mj9jaysOyIzzOQQtNdscjfKJ99vNp9H4y4l_6oYn
	wjuPKAGURDGDPtv80vRGk0dFWp6F5IefZNwhh2X0MZZ3zKTD6jnSx8KdBsTiD3usaAzudj_BeMbb
	U6bXtzXqGUSGv5VMcARGIEmgm2HotPyPhj0jyVLvdwsZrcOGKav5PwXzwFxBzS.xLjTNRAi7UdeJ
	Xwj_kurcZVs0vHbHVj5OlPwaO4OvvSHUMmMpQXGTzbs4p2D_Y0K_scpXfsgDLm1L64SybzO15Y8C
	mbaiPSLsFhj3L6Ih53SwGkD6Fc6Qvws3Zdi4zRfp7q1MWGAv6b_f.Up2tMmKe6bq6YiHO9Cf7w9z
	Pe_K5CnRI8L5owtZJGLH30O6HJyURoaolIl9kMmDiWBGpc4BUdSJXnNs0thhARGd20a4YiED50Q3
	.bAVGzUNz2anSxweliMaZiO3c_73mbZTDhIKRthqimi2O2eUqD6SPhlunI6HKDg0tj9lL5oAQEd.
	ZSI8YL8I07G1BCqHoPZ7wvmutvtlHaDw6YxRahukh.hOCAH4UMDJRXwfk0ONqgqHBSMoYu_TzAwV
	_fw_u6bXSlw4ohfwK6XlWUuVLJDwBVXb0nWHuyCEc0uwEAZmMqaSosv1onzsocjlLpbUejbvlpml
	wMkl43e8iaTq8Hi4huTUOsSN4GdBmISgdpMcsjODDkuyQd8COaUpaRmMgOllKmhEb6CRemCyvXNT
	B2aPt20piUFwND9xfHMtgWdaEtScVL3UXfBb6tpVx57I7PXDZ.B.FXU2ene0F0JFzrR5SIFQX61s
	EuF44F_aXcKNwHCuiVNQU5PsLiep0qJheVS.On_LwUHRab2KZYdzKjsXqOiYP7pY4ZD.FEgYWj0u
	oxVXWSEsGQWrUFk1_7PRroyUMby.DmBHBbeQ.PLeYmJAT.xI6eJaa85_Kr78NPpX6pZCurs3DBj7
	pTAPoq9krnrLPC8qdeLGTvGdkkzr3zEmjo4hls8.hzaiyjraa5fHHdfO7naj6JjvIld.lGYtzXH6
	4ID7rEYQnLX.24ZDHSVri5SmM_8cr_ijp6FHpOk9JYSVs9dJSVzntTQgOofGLnl3rFwfrwgg36D6
	CzgcKwFoPx9j8_brBSBLkA7SwoUxEf18lmPVXLU0ECbt79wCqs30jU1DNhwAZtjWjunKDpxDdxFT
	3iM4m2E2zVp7Dz5lbD6p2UQaZapMHBWfPjz0va4E-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic309.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 9 Mar 2020 23:58:40 +0000
Received: by smtp425.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 7a38e42435f828e6426264079edb10c1; 
	Mon, 09 Mar 2020 23:58:38 +0000 (UTC)
Subject: Re: [PATCH v15 03/23] LSM: Use lsmblob in security_audit_rule_match
To: Paul Moore <paul@paul-moore.com>
References: <20200222000407.110158-1-casey@schaufler-ca.com>
	<20200222000407.110158-4-casey@schaufler-ca.com>
	<CAHC9VhS+3K-AAzo2Z9iYTCx6wax0h2_grXayULDWsCFKezf8Jg@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	mQINBFzV9HABEAC/mmv3jeJyF7lR7QhILYg1+PeBLIMZv7KCzBSc/4ZZipoWdmr77Lel/RxQ
	1PrNx0UaM5r6Hj9lJmJ9eg4s/TUBSP67mTx+tsZ1RhG78/WFf9aBe8MSXxY5cu7IUwo0J/CG
	vdSqACKyYPV5eoTJmnMxalu8/oVUHyPnKF3eMGgE0mKOFBUMsb2pLS/enE4QyxhcZ26jeeS6
	3BaqDl1aTXGowM5BHyn7s9LEU38x/y2ffdqBjd3au2YOlvZ+XUkzoclSVfSR29bomZVVyhMB
	h1jTmX4Ac9QjpwsxihT8KNGvOM5CeCjQyWcW/g8LfWTzOVF9lzbx6IfEZDDoDem4+ZiPsAXC
	SWKBKil3npdbgb8MARPes2DpuhVm8yfkJEQQmuLYv8GPiJbwHQVLZGQAPBZSAc7IidD2zbf9
	XAw1/SJGe1poxOMfuSBsfKxv9ba2i8hUR+PH7gWwkMQaQ97B1yXYxVEkpG8Y4MfE5Vd3bjJU
	kvQ/tOBUCw5zwyIRC9+7zr1zYi/3hk+OG8OryZ5kpILBNCo+aePeAJ44znrySarUqS69tuXd
	a3lMPHUJJpUpIwSKQ5UuYYkWlWwENEWSefpakFAIwY4YIBkzoJ/t+XJHE1HTaJnRk6SWpeDf
	CreF3+LouP4njyeLEjVIMzaEpwROsw++BX5i5vTXJB+4UApTAQARAQABtChDYXNleSBTY2hh
	dWZsZXIgPGNhc2V5QHNjaGF1Zmxlci1jYS5jb20+iQJUBBMBCAA+FiEEC+9tH1YyUwIQzUIe
	OKUVfIxDyBEFAlzV9HACGwMFCRLMAwAFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQOKUV
	fIxDyBG6ag/6AiRl8yof47YOEVHlrmewbpnlBTaYNfJ5cZflNRKRX6t4bp1B2YV1whlDTpiL
	vNOwFkh+ZE0eI5M4x8Gw2Oiok+4Q5liA9PHTozQYF+Ia+qdL5EehfbLGoEBqklpGvG3h8JsO
	7SvONJuFDgvab/U/UriDYycJwzwKZuhVtK9EMpnTtUDyP3DY+Q8h7MWsniNBLVXnh4yBIEJg
	SSgDn3COpZoFTPGKE+rIzioo/GJe8CTa2g+ZggJiY/myWTS3quG0FMvwvNYvZ4I2g6uxSl7n
	bZVqAZgqwoTAv1HSXIAn9muwZUJL03qo25PFi2gQmX15BgJKQcV5RL0GHFHRThDS3IyadOgK
	P2j78P8SddTN73EmsG5OoyzwZAxXfck9A512BfVESqapHurRu2qvMoUkQaW/2yCeRQwGTsFj
	/rr0lnOBkyC6wCmPSKXe3dT2mnD5KnCkjn7KxLqexKt4itGjJz4/ynD/qh+gL7IPbifrQtVH
	JI7cr0fI6Tl8V6efurk5RjtELsAlSR6fKV7hClfeDEgLpigHXGyVOsynXLr59uE+g/+InVic
	jKueTq7LzFd0BiduXGO5HbGyRKw4MG5DNQvC//85EWmFUnDlD3WHz7Hicg95D+2IjD2ZVXJy
	x3LTfKWdC8bU8am1fi+d6tVEFAe/KbUfe+stXkgmfB7pxqW5Ag0EXNX0cAEQAPIEYtPebJzT
	wHpKLu1/j4jQcke06Kmu5RNuj1pEje7kX5IKzQSs+CPH0NbSNGvrA4dNGcuDUTNHgb5Be9hF
	zVqRCEvF2j7BFbrGe9jqMBWHuWheQM8RRoa2UMwQ704mRvKr4sNPh01nKT52ASbWpBPYG3/t
	WbYaqfgtRmCxBnqdOx5mBJIBh9Q38i63DjQgdNcsTx2qS7HFuFyNef5LCf3jogcbmZGxG/b7
	yF4OwmGsVc8ufvlKo5A9Wm+tnRjLr/9Mn9vl5Xa/tQDoPxz26+aWz7j1in7UFzAarcvqzsdM
	Em6S7uT+qy5jcqyuipuenDKYF/yNOVSNnsiFyQTFqCPCpFihOnuaWqfmdeUOQHCSo8fD4aRF
	emsuxqcsq0Jp2ODq73DOTsdFxX2ESXYoFt3Oy7QmIxeEgiHBzdKU2bruIB5OVaZ4zWF+jusM
	Uh+jh+44w9DZkDNjxRAA5CxPlmBIn1OOYt1tsphrHg1cH1fDLK/pDjsJZkiH8EIjhckOtGSb
	aoUUMMJ85nVhN1EbU/A3DkWCVFEA//Vu1+BckbSbJKE7Hl6WdW19BXOZ7v3jo1q6lWwcFYth
	esJfk3ZPPJXuBokrFH8kqnEQ9W2QgrjDX3et2WwZFLOoOCItWxT0/1QO4ikcef/E7HXQf/ij
	Dxf9HG2o5hOlMIAkJq/uLNMvABEBAAGJAjwEGAEIACYWIQQL720fVjJTAhDNQh44pRV8jEPI
	EQUCXNX0cAIbDAUJEswDAAAKCRA4pRV8jEPIEWkzEACKFUnpp+wIVHpckMfBqN8BE5dUbWJc
	GyQ7wXWajLtlPdw1nNw0Wrv+ob2RCT7qQlUo6GRLcvj9Fn5tR4hBvR6D3m8aR0AGHbcC62cq
	I7LjaSDP5j/em4oVL2SMgNTrXgE2w33JMGjAx9oBzkxmKUqprhJomPwmfDHMJ0t7y39Da724
	oLPTkQDpJL1kuraM9TC5NyLe1+MyIxqM/8NujoJbWeQUgGjn9uxQAil7o/xSCjrWCP3kZDID
	vd5ZaHpdl8e1mTExQoKr4EWgaMjmD/a3hZ/j3KfTVNpM2cLfD/QwTMaC2fkK8ExMsz+rUl1H
	icmcmpptCwOSgwSpPY1Zfio6HvEJp7gmDwMgozMfwQuT9oxyFTxn1X3rn1IoYQF3P8gsziY5
	qtTxy2RrgqQFm/hr8gM78RhP54UPltIE96VywviFzDZehMvuwzW//fxysIoK97Y/KBZZOQs+
	/T+Bw80Pwk/dqQ8UmIt2ffHEgwCTbkSm711BejapWCfklxkMZDp16mkxSt2qZovboVjXnfuq
	wQ1QL4o4t1hviM7LyoflsCLnQFJh6RSBhBpKQinMJl/z0A6NYDkQi6vEGMDBWX/M2vk9Jvwa
	v0cEBfY3Z5oFgkh7BUORsu1V+Hn0fR/Lqq/Pyq+nTR26WzGDkolLsDr3IH0TiAVH5ZuPxyz6
	abzjfg==
Message-ID: <d6d50183-c10b-e565-3e90-5fa7bc6b5841@schaufler-ca.com>
Date: Mon, 9 Mar 2020 16:58:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhS+3K-AAzo2Z9iYTCx6wax0h2_grXayULDWsCFKezf8Jg@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 029NwjuJ001873
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/6/2020 2:01 PM, Paul Moore wrote:
> On Fri, Feb 21, 2020 at 7:04 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>> Change the secid parameter of security_audit_rule_match
>> to a lsmblob structure pointer. Pass the entry from the
>> lsmblob structure for the approprite slot to the LSM hook.
>>
>> Change the users of security_audit_rule_match to use the
>> lsmblob instead of a u32. In some cases this requires a
>> temporary conversion using lsmblob_init() that will go
>> away when other interfaces get converted.
>>
>> Reviewed-by: Kees Cook <keescook@chromium.org>
>> Reviewed-by: John Johansen <john.johansen@canonical.com>
>> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
>> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
>> ---
>>  include/linux/security.h            |  7 ++++---
>>  kernel/auditfilter.c                |  6 ++++--
>>  kernel/auditsc.c                    | 14 ++++++++++----
>>  security/integrity/ima/ima.h        |  4 ++--
>>  security/integrity/ima/ima_policy.c |  7 +++++--
>>  security/security.c                 |  8 +++++---
>>  6 files changed, 30 insertions(+), 16 deletions(-)
> ...
>
>> diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
>> index 3a44abf4fced..509eb21eff7f 100644
>> --- a/kernel/auditfilter.c
>> +++ b/kernel/auditfilter.c
>> @@ -1327,6 +1327,7 @@ int audit_filter(int msgtype, unsigned int listtype)
>>                         struct audit_field *f = &e->rule.fields[i];
>>                         pid_t pid;
>>                         u32 sid;
>> +                       struct lsmblob blob;
>>
>>                         switch (f->type) {
>>                         case AUDIT_PID:
>> @@ -1357,8 +1358,9 @@ int audit_filter(int msgtype, unsigned int listtype)
>>                         case AUDIT_SUBJ_CLR:
>>                                 if (f->lsm_isset) {
>>                                         security_task_getsecid(current, &sid);
>> -                                       result = security_audit_rule_match(sid,
>> -                                                  f->type, f->op,
>> +                                       lsmblob_init(&blob, sid);
>> +                                       result = security_audit_rule_match(
>> +                                                  &blob, f->type, f->op,
>>                                                    f->lsm_rules);
> Unless I'm mistaken this patch is almost exclusively the following pattern:
>
>   lsmblob_init(blob, sid);
>   security_audit_rule_match(blob, ...);
>
> ... which means we are assigning every array member in @blob the same
> value of "sid" and then sending that into the LSM where each LSM is
> going to then have to index into that array, to all get the same
> value, and then do their match.  I'm assuming this will make more
> sense as I progress through the rest of the patchset, but right now it
> seems like we could get by just fine with a u32 here.

When I do the next version I'll put considerably more effort into
explaining the scaffolding strategy. I'm definitely in that area where
the advantage of keeping patches small and the advantage of making a
change obvious are at odds. This will apply to the next few patches in
the series as well.



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

